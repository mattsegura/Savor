import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/features/main_page/screens/main_page.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NutrientsAdapter());
  await Hive.openBox('grocery_list');
  await Hive.openBox('recipe_from_url');
  await Hive.openBox('meal_plan_recipe');
  // await Hive.deleteBoxFromDisk('recipe_from_url');
  // await Hive.deleteBoxFromDisk('meal_plan_recipe');
  // await Hive.deleteBoxFromDisk('grocery_list');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Savor',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              primary: const Color.fromARGB(250, 27, 184, 90)),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
