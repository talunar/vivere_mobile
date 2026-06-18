import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/workout_program.dart';
import '../providers/workout_providers.dart';
import 'programs_list_screen.dart';
import 'program_details_screen.dart';

class WorkoutCatalogScreen extends ConsumerStatefulWidget {
  const WorkoutCatalogScreen({super.key});

  @override
  ConsumerState<WorkoutCatalogScreen> createState() => _WorkoutCatalogScreenState();
}

class _WorkoutCatalogScreenState extends ConsumerState<WorkoutCatalogScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(paginatedWorkoutCategoriesProvider.notifier).fetchNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(paginatedWorkoutCategoriesProvider);
    final expandedCategoryId = ref.watch(expandedCategoryProvider);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headerHeight = statusBarHeight + 14;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Stack(
        children: [
          categoriesAsync.when(
            data: (categories) => ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.fromLTRB(16, headerHeight + 20, 16, 100),
              itemCount: categories.length + (categoriesAsync.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == categories.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
                  );
                }

                final category = categories[index];
                final isExpanded = expandedCategoryId == category.id;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      _CategoryHeader(
                        title: category.name,
                        imageUrl: category.image,
                        isExpanded: isExpanded,
                        onTap: () {
                          final current = ref.read(expandedCategoryProvider);
                          ref.read(expandedCategoryProvider.notifier).state =
                          current == category.id ? null : category.id;
                        },
                      ),
                      if (isExpanded)
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: _ProgramsExpandedList(
                            programs: category.programs,
                            categoryName: category.name,
                            categoryId: category.id,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
            error: (err, _) => Center(child: Text('Ошибка: $err')),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight + 16,
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
                      const Color(0xFFF6F6F6).withOpacity(0.3),
                      const Color(0xFFF6F6F6).withOpacity(0.1),
                      const Color(0xFFF6F6F6).withOpacity(0.0),
                    ],
                    stops: const [0.0, 0.2, 0.45, 0.6, 0.80, 0.88, 0.95]
                ),
              ),
            ),
          ),
        ],
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
        height: isExpanded ? 265 : 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isExpanded ? const Color(0xFF141414) : Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              if (!isExpanded)
                Positioned.fill(
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

              if (!isExpanded)
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
                        imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),

              if (!isExpanded)
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

              SizedBox(
                height: isExpanded ? 50 : 180,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: isExpanded ? 0 : 10),
                  child: Column(
                    crossAxisAlignment: isExpanded ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    mainAxisAlignment: isExpanded
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.end,
                    children: [
                      if (!isExpanded)
                        const Text(
                          '10 программ',
                          style: TextStyle(
                              color: Color(0xFFF6F6F6),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFFF6F6F6),
                          fontSize: isExpanded ? 24 : 40,
                          fontWeight:
                          isExpanded ? FontWeight.normal : FontWeight.w700,
                        ),
                        textAlign: isExpanded ? TextAlign.center : TextAlign.left,
                      ),
                    ],
                  ),
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
  final int categoryId;

  const _ProgramsExpandedList({
    required this.programs,
    required this.categoryName,
    required this.categoryId,
  });

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
        height: 215,
        decoration: BoxDecoration(
          color: const Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            itemCount: (programs.length > 5 ? 5 : programs.length) + 1,
            itemBuilder: (context, index) {
              final displayedCount = programs.length > 5 ? 5 : programs.length;
              if (index == displayedCount) {
                return _SeeAllButton(
                    categoryName: categoryName, categoryId: categoryId);
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
          MaterialPageRoute(
              builder: (context) => ProgramDetailsScreen(program: program)),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/programs/workout_1.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              program.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFFB800), size: 12),
                Text(
                  ' ${program.rating}',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
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
  final int categoryId;

  const _SeeAllButton({required this.categoryName, required this.categoryId});

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
                  categoryId: categoryId,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
