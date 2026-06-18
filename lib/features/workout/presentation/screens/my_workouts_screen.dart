import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_button.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/workout_program.dart';
import '../providers/workout_providers.dart';
import '../providers/navigation_provider.dart';
import 'programs_list_screen.dart';
import 'dart:ui' as ui;

class MyWorkoutsScreen extends ConsumerWidget {
  final Function(WorkoutProgram)? onSelect;
  const MyWorkoutsScreen({super.key, this.onSelect});

  bool get _isSelectionMode => onSelect != null;

  void _navigateToCatalog(WidgetRef ref) {
    ref.read(expandedCategoryProvider.notifier).state = null;
    ref.invalidate(paginatedWorkoutCategoriesProvider);
    ref.read(navigationResetProvider.notifier).update((state) => state + 1);
    ref.read(navigationNotifierProvider.notifier).setIndex(0);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final userId = authState.maybeWhen(
      authenticated: (user) => user.id.value,
      orElse: () => null,
    );

    if (userId == null) {
      return const Scaffold(body: Center(child: Text('Пожалуйста, войдите в систему')));
    }

    final favoritesAsync = ref.watch(favoriteProgramsProvider(userId));
    final categoriesAsync = ref.watch(paginatedWorkoutCategoriesProvider);

    final double topPadding = MediaQuery.of(context).padding.top;
    final double headerHeight = topPadding + 56;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Stack(
        children: [
          favoritesAsync.when(
            data: (favorites) {
              return categoriesAsync.when(
                data: (categories) {
                  final List<Map<String, dynamic>> displayData = [];

                  for (final category in categories) {
                    final favoritesInCategory = category.programs
                        .where((p) => favorites.any((f) => f.id == p.id))
                        .toList();

                    if (favoritesInCategory.isNotEmpty) {
                      displayData.add({
                        'category': category,
                        'favorites': favoritesInCategory,
                      });
                    }
                  }

                  if (displayData.isEmpty) {
                    return _buildEmptyState(ref);
                  }

                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(16, headerHeight + 20, 16, 120),
                    itemCount: displayData.length + 1,
                    itemBuilder: (context, index) {
                      if (index == displayData.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: AppButton(
                            text: 'Найти новые',
                            onPressed: () => _navigateToCatalog(ref),
                          ),
                        );
                      }

                      final data = displayData[index];
                      final category = data['category'];
                      final count = data['favorites'].length;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _FavoriteCategoryCard(
                          title: category.name,
                          imageUrl: category.image,
                          programCount: count,
                          onTap: () async {
                            final result = await Navigator.push<WorkoutProgram>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProgramsListScreen(
                                  categoryName: category.name,
                                  categoryId: category.id,
                                  programs: data['favorites'],
                                  onSelect: _isSelectionMode ? (_) {} : null,
                                ),
                              ),
                            );
                            
                            if (result != null && _isSelectionMode) {
                              onSelect!(result);
                              if (context.mounted) Navigator.pop(context);
                            }
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
                error: (err, _) => Center(child: Text('Ошибка: $err')),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
            error: (err, _) => Center(child: Text('Ошибка: $err')),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight + 30,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF6F6F6),
                    const Color(0xFFF6F6F6),
                    const Color(0xFFF6F6F6).withOpacity(0.98),
                    const Color(0xFFF6F6F6).withOpacity(0.78),
                    const Color(0xFFF6F6F6).withOpacity(0.45),
                    const Color(0xFFF6F6F6).withOpacity(0.16),
                    const Color(0xFFF6F6F6).withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.4, 0.65, 0.72, 0.80, 0.88, 0.95],
                ),
              ),
            ),
          ),

          Positioned(
            top: topPadding,
            left: 16,
            right: 16,
            height: 56,
            child: Row(
              children: [
                _IconBtn(
                  asset: 'assets/icons/back.svg',
                  onTap: () async {
                    final canPop = await Navigator.of(context).maybePop();
                    if (!canPop) {
                      ref.read(navigationNotifierProvider.notifier).goBack();
                    }
                  },
                ),
                Expanded(
                  child: Text(
                    _isSelectionMode ? 'Выберите тренировку' : 'Мои тренировки',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF141414),
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 44),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'У вас пока нет избранных тренировок',
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
          ),
          const SizedBox(height: 20),
          AppButton(
            text: 'Найти новые',
            onPressed: () => _navigateToCatalog(ref),
          ),
        ],
      ),
    );
  }
}

class _FavoriteCategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int programCount;
  final VoidCallback onTap;

  const _FavoriteCategoryCard({
    required this.title,
    required this.imageUrl,
    required this.programCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imageUrl, // Исправлено: используем imageUrl вместо хардкода
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              Positioned.fill(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                      stops: [0.2, 0.5],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: ImageFiltered(
                    imageFilter: ui.ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Image.asset(
                      imageUrl, // Исправлено: используем imageUrl для блюра
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.65),
                        Colors.black.withOpacity(0.25),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.45, 0.75],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$programCount ${_getProgramWord(programCount)}',
                      style: const TextStyle(
                        color: Color(0xFFF6F6F6),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFFF6F6F6),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getProgramWord(int count) {
    if (count % 10 == 1 && count % 100 != 11) {
      return 'программа';
    } else if (count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 >= 20)) {
      return 'программы';
    } else {
      return 'программ';
    }
  }
}

class _IconBtn extends StatelessWidget {
  final String asset;
  final VoidCallback? onTap;
  const _IconBtn({required this.asset, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(color: Color(0xFFE2E2E2), shape: BoxShape.circle),
        child: Center(
          child: SvgPicture.asset(
            asset,
            width: 44,
            height: 44,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
