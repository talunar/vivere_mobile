import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/workout_providers.dart';
import '../../domain/entities/workout_program.dart';
import 'programs_list_screen.dart';
import 'program_details_screen.dart';

class WorkoutCatalogScreen extends ConsumerStatefulWidget {
  const WorkoutCatalogScreen({super.key});

  @override
  ConsumerState<WorkoutCatalogScreen> createState() => _WorkoutCatalogScreenState();
}

class _WorkoutCatalogScreenState extends ConsumerState<WorkoutCatalogScreen> {
  int? expandedCategoryId;

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(workoutCategoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Тренировки',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: categoriesAsync.when(
        data: (categories) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final isExpanded = expandedCategoryId == category.id;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // 1. Заголовок категории (нижний слой)
                  _CategoryHeader(
                    title: category.name,
                    imageUrl: category.image,
                    isExpanded: isExpanded,
                    onTap: () {
                      setState(() {
                        expandedCategoryId = isExpanded ? null : category.id;
                      });
                    },
                  ),
                  // 2. Список программ (верхний слой)
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 50), 
                      child: _ProgramsExpandedList(
                        programs: category.programs,
                        categoryName: category.name,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Ошибка: $err')),
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isExpanded;
  final VoidCallback onTap;

  const _CategoryHeader({
    required this.title,
    required this.imageUrl,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // Высота подбирается под размер программ: 50 (отступ) + 215 (высота списка) = 265
        height: isExpanded ? 265 : 180, 
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isExpanded ? const Color(0xFF141414) : Colors.transparent,
          image: isExpanded 
            ? null 
            : DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
              ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: isExpanded ? 15 : 0, left: 20, right: 20, bottom: isExpanded ? 0 : 20),
          child: Column(
            crossAxisAlignment: isExpanded ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            mainAxisAlignment: isExpanded ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              if (!isExpanded)
                const Text(
                  '10 программ',
                  style: TextStyle(
                    color: Color(0xFFF6F6F6),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFFF6F6F6), 
                  fontSize: isExpanded ? 20 : 28, 
                  fontWeight: isExpanded ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgramsExpandedList extends StatelessWidget {
  final List<WorkoutProgram> programs;
  final String categoryName;

  const _ProgramsExpandedList({required this.programs, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 10 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        height: 215, // Увеличили для вмещения квадратных карточек
        margin: EdgeInsets.zero, 
        decoration: BoxDecoration(
          color: const Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(24), // Синхронизировано с заголовком
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            itemCount: programs.length > 5 ? 6 : programs.length,
            itemBuilder: (context, index) {
              if (index == 5) {
                return _SeeAllButton(categoryName: categoryName, programs: programs);
              }
              return _ProgramMiniCard(program: programs[index]);
            },
          ),
        ),
      ),
    );
  }
}

class _ProgramMiniCard extends StatelessWidget {
  final WorkoutProgram program;
  const _ProgramMiniCard({required this.program});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProgramDetailsScreen(program: program)),
        );
      },
      child: Container(
        width: 150, // Ширина для квадратной картинки
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                program.image ?? '', 
                height: 150, // Квадратная картинка
                width: 150, 
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              program.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 12),
                Text(
                  ' ${program.rating}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SeeAllButton extends StatelessWidget {
  final String categoryName;
  final List<WorkoutProgram> programs;
  const _SeeAllButton({required this.categoryName, required this.programs});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProgramsListScreen(
                  categoryName: categoryName,
                  programs: programs,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
