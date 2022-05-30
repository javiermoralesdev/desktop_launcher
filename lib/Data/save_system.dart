import 'dart:convert';

import 'package:desktop_launcher/Data/settings_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveSettings(SettingsData data) async {
  final prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(data);
  await prefs.setString('settings', jsonString);
}

Future<SettingsData> loadSettings() async {
  final prefs = await SharedPreferences.getInstance();
  String jsonString = prefs.getString('settings') ?? "";
  if (jsonString.isEmpty) {
    return SettingsData(false, false);
  }
  return SettingsData.fromJson(jsonDecode(jsonString));
}
