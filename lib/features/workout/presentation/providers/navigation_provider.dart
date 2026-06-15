import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'navigation_provider.g.dart';

final navigationResetProvider = StateProvider<int>((ref) => 0);

final navigationHistoryProvider = StateProvider<List<int>>((ref) => []);

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  int build() => 0;

  void setIndex(int index) {
    if (state != index) {
      final history = ref.read(navigationHistoryProvider);
      ref.read(navigationHistoryProvider.notifier).state = [...history, state];
      state = index;
    }
  }

  void goBack() {
    final history = ref.read(navigationHistoryProvider);
    if (history.isNotEmpty) {
      final lastIndex = history.last;
      ref.read(navigationHistoryProvider.notifier).state =
          history.sublist(0, history.length - 1);
      state = lastIndex;
    }
  }
}
