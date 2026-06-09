import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'navigation_provider.g.dart';

// Провайдер для управления сбросом навигации. 
// Изменение этого значения приведет к полной переинициализации навигатора каталога.
final navigationResetProvider = StateProvider<int>((ref) => 0);

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}
