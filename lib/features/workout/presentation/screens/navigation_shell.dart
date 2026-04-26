import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'workout_catalog_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // Ключ для управления навигацией внутри вкладки "Главная"
  final GlobalKey<NavigatorState> _workoutNavigatorKey = GlobalKey<NavigatorState>();

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      // Если нажали на уже выбранную вкладку "Главная", возвращаемся в ее начало
      if (index == 0) {
        _workoutNavigatorKey.currentState?.popUntil((route) => route.isFirst);
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Вкладка 1: Главная с вложенным навигатором
          Navigator(
            key: _workoutNavigatorKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const WorkoutCatalogScreen(),
            ),
          ),
          const Center(child: Text('План')),
          const Center(child: Text('Тренировки')),
          const Center(child: Text('Профиль')),
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
            currentIndex: _selectedIndex,
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
              _buildMenuItem('assets/icons/category.svg', 'Главная', 0),
              _buildMenuItem('assets/icons/calendar.svg', 'План', 1),
              _buildMenuItem('assets/icons/favorites.svg', 'Тренировки', 2),
              _buildMenuItem('assets/icons/profile.svg', 'Профиль', 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildMenuItem(String assetPath, String label, int index) {
    final bool isActive = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 8),
        child: SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
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
