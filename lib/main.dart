import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapi/features/search_swapi/views/swapi_screen.dart';
import 'package:swapi/services/service_locator.dart';

void main() async {
  await dotenv.load();
  registerServices();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWAPI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.deepPurple)),
        listTileTheme: const ListTileThemeData(
          titleTextStyle: TextStyle(color: Colors.deepPurple),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.deepPurple),
          bodyLarge: TextStyle(color: Colors.deepPurple),
          bodyMedium: TextStyle(color: Colors.deepPurple),
        ),
      ),
      home: const SwapiScreen(),
    );
  }
}
