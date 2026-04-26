import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/workout_providers.dart';
import '../../domain/entities/workout_category.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Выводим список категорий
    final categoriesAsync = ref.watch(workoutCategoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        title: const Text('Категории тренировок'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: categoriesAsync.when(
        data: (categories) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _CategoryCard(category: categories[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Ошибка: $err')),
      ),
    );
  }
}

// Дизайн карточки
class _CategoryCard extends StatelessWidget {
  final WorkoutCategory category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Изображение категории
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: category.image.startsWith('http')
                  ? Image.network(
                category.image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              )
                  : Container(
                width: 120,
                height: 120,
                color: const Color(0xFFE0E0E0),
                child: const Icon(Icons.fitness_center, size: 40),
              ),
            ),
            const SizedBox(width: 20),

            // Контентная часть
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // TODO ЗАГЛУШКА: Блок с рейтингом (пока нет бэка)
                  const Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFD153), size: 20),
                      SizedBox(width: 6),
                      Text(
                        '4.9', // Статичная оценка, заменить на category.rating.toString()
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // TODO ЗАГЛУШКА: Блок тренера (пока нет бэка)
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF0F0F0),
                        ),
                        child: const Icon(Icons.person, size: 20, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Крош', // Статичное имя, заменить на category.trainerName
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}