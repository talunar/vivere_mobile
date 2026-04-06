import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/workout_providers.dart';
import 'package:vivere_mobile/features/workout/domain/entities/workout_program.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Получаем данные
    final topProgramsAsync = ref.watch(topProgramsProvider);

    return Scaffold(
      // Цвет фона, appbar без тени
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        title: const Text('Все программы'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: topProgramsAsync.when(
        data: (programs) => ListView.separated(
          // Отступы списка от краев
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: programs.length,
          itemBuilder: (context, index) {
            // Карточка
            return _WorkoutProgramCard(program: programs[index]);
          },
          // Отступ между карточками
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Ошибка: $err')),
      ),
    );
  }
}

// Дизайн карточки реализован в отдельном виджете
class _WorkoutProgramCard extends StatelessWidget {
  final WorkoutProgram program;

  const _WorkoutProgramCard({required this.program});

  @override
  Widget build(BuildContext context) {
    // Карточка с тенью и скруглением
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32), // Скругление как в дизайне Ани
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Отступы внутри карточки
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Изображение для тренировки
            ClipRRect(
              borderRadius: BorderRadius.circular(24), // Скругление картинки
              child: Image.asset(
                program.imageUrl,
                width: 130, // Размеры как в дизайне
                height: 130,
                fit: BoxFit.cover, // Чтобы картинка не растягивалась
              ),
            ),
            const SizedBox(width: 20), // Расстояние от картинки до текста

            // Текстовый блок справа
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок программы
                  Text(
                    program.title,
                    maxLines: 2, // Ограничим в 2 строки
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      // fontFamily: 'Golos Text', // <-- ВКЛЮЧИМ ПОЗЖЕ
                    ),
                  ),
                  const SizedBox(height: 8), // Отступ

                  // Блок с рейтингом
                  Row(
                    children: [
                      // Иконка звездочки (не вышло пока сделать, как у Ани)
                      const Icon(Icons.star, color: Color(0xFFFFD153), size: 20),
                      const SizedBox(width: 6),
                      Text(
                        program.rating.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // fontFamily: 'Golos Text',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // Большой отступ

                  // Блок тренера
                  Row(
                    children: [
                      // Аватар тренера
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE0E0E0), // Фон аватара
                        ),
                        child: const Icon(Icons.person, color: Colors.grey),
                      ),
                      const SizedBox(width: 12),
                      // Имя тренера
                      Expanded(
                        child: Text(
                          program.trainerName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            // fontFamily: 'Golos Text',
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