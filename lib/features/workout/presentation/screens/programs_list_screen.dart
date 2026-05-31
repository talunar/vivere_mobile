import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vivere_mobile/features/workout/domain/entities/workout_program.dart';
import 'package:vivere_mobile/features/workout/presentation/providers/workout_providers.dart';
import 'package:vivere_mobile/features/workout/presentation/screens/program_details_screen.dart';

class ProgramsListScreen extends ConsumerWidget {
  final String categoryName;
  final int categoryId;
  final List<WorkoutProgram>? programs;

  const ProgramsListScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
    this.programs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Если список программ передан явно (например, только избранные), используем его.
    // Иначе загружаем все программы категории из провайдера.
    final programsAsync = programs != null
        ? AsyncValue.data(programs!)
        : ref.watch(programsByCategoryProvider(categoryId));

    final double topPadding = MediaQuery.of(context).padding.top;
    final double headerHeight = topPadding + 56;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Stack(
        children: [
          Positioned.fill(
            child: programsAsync.when(
              data: (programs) => SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16, headerHeight + 20, 16, 100),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E2E2),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: programs.asMap().entries.map((entry) {
                      final index = entry.key;
                      final program = entry.value;
                      final isLast = index == programs.length - 1;

                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
                        child: ProgramCard(
                          program: program,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProgramDetailsScreen(program: program),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              loading: () => const Center(
                  child: CircularProgressIndicator(color: Color(0xFFFF5900))),
              error: (err, st) => Center(child: Text('Ошибка: $err')),
            ),
          ),

          // Градиент сверху
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
                    const Color(0xFFF6F6F6),
                    const Color(0xFFF6F6F6).withOpacity(0.98),
                    const Color(0xFFF6F6F6).withOpacity(0.78),
                    const Color(0xFFF6F6F6).withOpacity(0.45),
                    const Color(0xFFF6F6F6).withOpacity(0.16),
                    const Color(0xFFF6F6F6).withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.4, 0.65, 0.72, 0.80, 0.88, 0.95, 1.0],
                ),
              ),
            ),
          ),

          // Заголовок и кнопка назад
          Positioned(
            top: topPadding,
            left: 16,
            right: 16,
            height: 56,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE2E2E2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/icons/back.svg'),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    categoryName,
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
}

class ProgramCard extends StatelessWidget {
  final WorkoutProgram program;
  final VoidCallback? onTap;

  const ProgramCard({super.key, required this.program, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/programs/workout_1.png",
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF141414),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFFB800), size: 16),
                        const SizedBox(width: 5),
                        Text(
                          program.rating?.toString() ?? "4.8",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF141414),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage:
                              AssetImage("assets/images/programs/workout_1.png"),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            program.trainerName ?? "Super train 3000",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
