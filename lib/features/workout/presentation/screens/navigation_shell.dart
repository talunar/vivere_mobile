import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../profile/presentation/screens/person_page.dart';
import '../providers/navigation_provider.dart';
import '../providers/workout_providers.dart';
import 'workout_catalog_screen.dart';
import 'calendar_screen.dart';
import 'my_workouts_screen.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  ConsumerState<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  GlobalKey<NavigatorState> _workoutNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _calendarNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _myWorkoutsNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _profileNavigatorKey = GlobalKey<NavigatorState>();

  void _onItemTapped(int index) {
    final currentIndex = ref.read(navigationNotifierProvider);
    if (index == 0 || currentIndex == index) {
      _resetNavigator(index);
    }

    if (currentIndex != index) {
      ref.read(navigationNotifierProvider.notifier).setIndex(index);
    }
  }

  void _resetNavigator(int index) {
    setState(() {
      if (index == 0) {
        _workoutNavigatorKey = GlobalKey<NavigatorState>();
        ref.read(expandedCategoryProvider.notifier).state = null;
      } else if (index == 1) {
        _calendarNavigatorKey = GlobalKey<NavigatorState>();
      } else if (index == 2) {
        _myWorkoutsNavigatorKey = GlobalKey<NavigatorState>();
      } else if (index == 3) {
        _profileNavigatorKey = GlobalKey<NavigatorState>();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navigationNotifierProvider);
    ref.listen(navigationResetProvider, (previous, next) {
      if (next != previous) {
        _resetNavigator(0);
      }
    });

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: [
          Navigator(
            key: _workoutNavigatorKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const WorkoutCatalogScreen(),
            ),
          ),
          Navigator(
            key: _calendarNavigatorKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const CalendarScreen(),
            ),
          ),
          Navigator(
            key: _myWorkoutsNavigatorKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const MyWorkoutsScreen(),
            ),
          ),
          Navigator(
            key: _profileNavigatorKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const PersonPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFFF6F6F6),
            selectedItemColor: const Color(0xFFFF5900),
            unselectedItemColor: const Color(0xFF9E9E9E),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
            ),
            elevation: 0,
            items: [
              _buildMenuItem('assets/icons/category.svg', 'Каталог', 0, selectedIndex),
              _buildMenuItem('assets/icons/calendar.svg', 'Календарь', 1, selectedIndex),
              _buildMenuItem('assets/icons/favorites.svg', 'Тренировки', 2, selectedIndex),
              _buildMenuItem('assets/icons/profile.svg', 'Профиль', 3, selectedIndex),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildMenuItem(String assetPath, String label, int index, int selectedIndex) {
    final bool isActive = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 8),
        child: SvgPicture.asset(
          assetPath,
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(
            isActive ? const Color(0xFFFF5900) : const Color(0xFF9E9E9E),
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}
