import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Future<CookieJar> cookieJar(CookieJarRef ref) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final jar = PersistCookieJar(
    ignoreExpires: false,
    storage: FileStorage("$appDocPath/.cookies/"),
  );
  return jar;
}

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8080',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  ref.watch(cookieJarProvider).whenData((jar) {
    dio.interceptors.add(CookieManager(jar));
  });

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final authState = ref.read(authControllerProvider);

      authState.mapOrNull(
        authenticated: (state) {
          final token = state.user.token;
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        },
      );

      return handler.next(options);
    },
    onError: (DioException e, handler) async {
      if (e.response?.statusCode == 401) {
        final authState = ref.read(authControllerProvider);
        final bool isAuth = authState.maybeMap(
          authenticated: (_) => true,
          orElse: () => false,
        );

        if (isAuth) {
          try {
            final nickName = authState.maybeMap(
              authenticated: (s) => s.user.nickName,
              orElse: () => null,
            );

            if (nickName != null) {
              await dio.post('/refresh-token', data: {'nick_name': nickName});

              final response = await dio.fetch(e.requestOptions);
              return handler.resolve(response);
            }
          } catch (refreshError) {
            ref.read(authControllerProvider.notifier).logout();
          }
        }
      }
      return handler.next(e);
    },
  ));

  return dio;
}
