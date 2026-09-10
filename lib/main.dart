import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_settings_provider.dart';
import 'pages/article_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Article Reader',
      themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: ArticlePage(),
    );
  }
}