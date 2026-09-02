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
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 1. Font Family[cite: 1]
          const Text('Font Family', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          DropdownButton<String>(
            value: settings.fontFamily,
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: 'SansSerif', child: Text('SansSerif')),
              DropdownMenuItem(value: 'Serif', child: Text('Serif')),
              DropdownMenuItem(value: 'Monospace', child: Text('Monospace')),
            ],
            onChanged: (String? newFont) {
              if (newFont != null) settings.setFontFamily(newFont);
            },
          ),
          const Divider(height: 30),

          // 2. Font Size[cite: 1]
          const Text('Font Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          RadioListTile<double>(
            title: const Text('Small (14px)'),
            value: 14.0, // Small[cite: 1]
            groupValue: settings.fontSize,
            onChanged: (double? value) {
              if (value != null) settings.setFontSize(value);
            },
          ),
          RadioListTile<double>(
            title: const Text('Large (20px)'),
            value: 20.0, // Large[cite: 1]
            groupValue: settings.fontSize,
            onChanged: (double? value) {
              if (value != null) settings.setFontSize(value);
            },
          ),
          const Divider(height: 30),

          // 3. Display Mode[cite: 1]
          const Text('Display Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SwitchListTile(
            title: Text(settings.isDarkMode ? 'Dark Mode' : 'Light Mode'),
            value: settings.isDarkMode,
            onChanged: (bool value) {
              settings.toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}