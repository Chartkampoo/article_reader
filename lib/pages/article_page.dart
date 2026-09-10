import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/article_model.dart';
import '../providers/app_settings_provider.dart';
import 'settings_page.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage({super.key});

  final ArticleModel sampleArticle = ArticleModel(
    title: 'เริ่มต้นการเรียนรู้ Flutter และ Shared Storage',
    author: 'ผู้เขียนบทความ',
    publishedDate: '10 กันยายน 2026',
    content: 'Flutter คือ UI SDK โอเพ่นซอร์สที่สร้างขึ้นโดย Google '
        'ใช้สำหรับการพัฒนาแอปพลิเคชันที่สร้างขึ้นจากโค้ดเบสเดียวทั้งใน Android, iOS, Web และ Desktop\n\n'
        'การจัดเก็บข้อมูลแบบ Shared Preferences ช่วยให้เราสามารถบันทึกค่าการตั้งค่าของผู้ใช้ '
        'เช่น ธีม หรือขนาดตัวอักษร ไว้บนอุปกรณ์ได้อย่างง่ายดาย ทำให้เมื่อเปิดแอปพลิเคชันกลับมาใช้งานในครั้งถัดไป '
        'แอปยังคงนำค่าที่เคยตั้งไว้มาแสดงผลได้ทันที',
  );

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          sampleArticle.title,
          style: TextStyle(fontFamily: settings.fontFamily),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sampleArticle.title,
              style: TextStyle(
                fontSize: settings.fontSize + 6,
                fontWeight: FontWeight.bold,
                fontFamily: settings.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ผู้เขียน: ${sampleArticle.author} | ${sampleArticle.publishedDate}',
              style: TextStyle(
                fontSize: settings.fontSize - 2,
                color: Colors.grey,
                fontFamily: settings.fontFamily,
              ),
            ),
            const Divider(height: 30),
            Text(
              sampleArticle.content,
              style: TextStyle(
                fontSize: settings.fontSize,
                fontFamily: settings.fontFamily,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}