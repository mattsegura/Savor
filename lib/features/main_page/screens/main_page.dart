import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/recipes_page/screens/recipes_page.dart';
import 'package:meal_ai/features/meal_plan_page/screens/meal_plane_page.dart';
import 'package:meal_ai/features/settings_page/screens/settings_page.dart';
import 'package:meal_ai/features/grocery_list_page/screens/grocery_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Recipes(),
    const GroceryListPage(),
    const MealPlanPage(),
    const SettingsPage(),
  ];

  bool isOnMainPage = true;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          if (!isOnMainPage) {
            setState(() {
              isOnMainPage = true;
            });
            return false;
          }
          return true;
        },
        child: pages[currentIndex],
      ),
      bottomNavigationBar: isOnMainPage
          ? BottomNavigationBar(
              unselectedFontSize: 12,
              selectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset('images/book.svg',
                          width: 25,
                          height: 25,
                          // ignore: deprecated_member_use
                          color: currentIndex == 0
                              ? context.primaryColor
                              : Colors.grey),
                      const SizedBox(height: 5),
                    ],
                  ),
                  label: 'Recipes',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined,
                          color:
                              currentIndex == 1 ? Colors.green : Colors.grey),
                      const SizedBox(height: 5),
                    ],
                  ),
                  label: 'Grocery List',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(Icons.calendar_month_outlined,
                          color:
                              currentIndex == 2 ? Colors.green : Colors.grey),
                      const SizedBox(height: 5),
                    ],
                  ),
                  label: 'Meal Plan',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(Icons.settings_outlined,
                          color:
                              currentIndex == 3 ? Colors.green : Colors.grey),
                      const SizedBox(height: 5),
                    ],
                  ),
                  label: 'Settings',
                ),
              ],
            )
          : null,
    );
  }
}
