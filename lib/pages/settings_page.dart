import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('การตั้งค่าแอปพลิเคชัน'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('โหมดมืด (Dark Mode)'),
            value: settings.isDarkMode,
            onChanged: (value) {
              settings.toggleDarkMode(value);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('ขนาดตัวอักษร'),
            trailing: DropdownButton<double>(
              value: settings.fontSize,
              items: const [
                DropdownMenuItem(value: 14.0, child: Text('เล็ก (14px)')),
                DropdownMenuItem(value: 17.0, child: Text('กลาง (17px)')),
                DropdownMenuItem(value: 20.0, child: Text('ใหญ่ (20px)')),
              ],
              onChanged: (value) {
                if (value != null) {
                  settings.setFontSize(value);
                }
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('รูปแบบตัวอักษร'),
            trailing: DropdownButton<String>(
              value: settings.fontFamily,
              items: const [
                DropdownMenuItem(value: 'Roboto', child: Text('Roboto')),
                DropdownMenuItem(value: 'Sarabun', child: Text('Sarabun')),
                DropdownMenuItem(value: 'Kanit', child: Text('Kanit')),
              ],
              onChanged: (value) {
                if (value != null) {
                  settings.setFontFamily(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}