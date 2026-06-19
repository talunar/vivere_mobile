import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'network_config.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
CookieJar cookieJar(CookieJarRef ref) {
  return CookieJar();
}

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final jar = ref.watch(cookieJarProvider);
  
  final dio = Dio(BaseOptions(
    baseUrl: NetworkConfig.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  dio.interceptors.add(CookieManager(jar));

  // Логирование
  dio.interceptors.add(LogInterceptor(
    requestHeader: true,
    responseHeader: true,
    requestBody: true,
    responseBody: true,
  ));

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
              await dio.post(NetworkConfig.refreshToken, data: {'nick_name': nickName});
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
