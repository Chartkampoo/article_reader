import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_settings_provider.dart';
import 'pages/article_page.dart';

void main() {
  runApp(
    // ผูก Provider ไว้ที่ชั้นนอกสุดของแอป[cite: 1]
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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light, // สลับธีม[cite: 1]
      home: const ArticlePage(),
    );
  }
}