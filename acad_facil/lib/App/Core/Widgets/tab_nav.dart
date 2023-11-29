import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/assets.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TabNav extends StatefulWidget {
  final int currentScreen;

  const TabNav({super.key, required this.currentScreen});

  @override
  State<TabNav> createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> {
  final List<String> _screens = [
    AppRoutes.home,
    AppRoutes.grades,
    AppRoutes.profileSettingsScreen,
  ];

  void _nextScreen(int screen) {
    final nav = Navigator.of(context);
    final homeController = Provider.of<HomeController>(context, listen: false);
    final providerUser = homeController.user;
    final disciplines = homeController.disciplines ?? [];

    switch (screen) {
      case 0:
        nav.pushNamedAndRemoveUntil(
          _screens.elementAt(screen),
          (route) => false,
        );
        break;

      case 1:
        nav.pushNamed(
          _screens.elementAt(screen),
          arguments: {
            "disciplines": disciplines,
            "period": providerUser?.period ?? 0,
          },
        );
        break;

      case 2:
        nav.pushNamed(
          _screens.elementAt(screen),
          arguments: providerUser,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorsStyles.primary,
      currentIndex: widget.currentScreen,
      onTap: _nextScreen,
      fixedColor: ColorsStyles.terciary,
      unselectedItemColor: Colors.white,
      items: [
        _buildNavigationBarItem(0, Assets.home, "Home"),
        _buildNavigationBarItem(1, Assets.grades, "Notas"),
        _buildNavigationBarItem(2, Assets.userIcon, "Perfil"),
      ],
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      int index, String asset, String label) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(
            widget.currentScreen == index
                ? ColorsStyles.terciary
                : Colors.white,
            BlendMode.srcATop,
          ),
          height: 24,
          width: 24,
        ),
        label: label);
  }
}
