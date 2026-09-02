import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/article_model.dart';
import '../providers/app_settings_provider.dart';
import 'settings_page.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    // จำลองบทความยาวๆ[cite: 1]
    final sampleArticle = Article(
      title: 'การใช้งาน Flutter ร่วมกับ State Management',
      content: 
          'บทความนี้เป็นบทความจำลองที่มีความยาวมากๆ เพื่อทดสอบการทำงานของ Article Reader '
          'โดยเราสามารถปรับเปลี่ยนขนาดตัวอักษร (Font Size) เปลี่ยนตระกูลฟอนต์ (Font Family) '
          'รวมถึงเปลี่ยนโหมดการแสดงผลแบบ Light Mode หรือ Dark Mode ได้จากหน้าการตั้งค่า (Settings)\n\n'
          'Flutter เป็น UI Framework ที่พัฒนาโดย Google ช่วยให้ผู้พัฒนาสามารถสร้าง Mobile Application '
          'ที่ทำงานได้ทั้งบน iOS และ Android ด้วยฐานโค้ดเดียว (Single Codebase)\n\n'
          'การใช้ Provider Package ในการทำ State Management ช่วยให้เราสามารถส่งต่อข้อมูลสภาพแวดล้อม '
          'หรือการตั้งค่าต่าง ๆ ไปยังทุก ๆ หน้าของแอปได้อย่างง่ายดาย โดยไม่ต้องส่งผ่านพารามิเตอร์ซ้ำซ้อน\n\n'
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut '
          'labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco '
          'laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in '
          'voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat '
          'non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n'
          'ความยาวของเนื้อหานี้ถูกออกแบบมาเพื่อให้สามารถกดเลื่อนอ่าน (Scroll) ลงมาได้เมื่อข้อความเกินขอบเขตของหน้าจอ',
    );

    final settings = Provider.of<AppSettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(sampleArticle.title), // แสดงชื่อบทความส่วนหัว[cite: 1]
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // ปุ่มไปหน้า Settings[cite: 1]
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      // รองรับการ Scroll[cite: 1]
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          sampleArticle.content,
          style: TextStyle(
            fontSize: settings.fontSize,
            fontFamily: settings.fontFamily,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}