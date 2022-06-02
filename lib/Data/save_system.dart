import 'dart:convert';

import 'package:desktop_launcher/Data/program.dart';
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

enum SoftwareType { FOLDER, PROGRAM }

Future<List<Program>> loadPrograms(SoftwareType type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = prefs.getString(
        type == SoftwareType.PROGRAM ? "programs" : "folders",
      ) ??
      "";
  if (jsonString == "") {
    return [];
  }
  Iterable i = jsonDecode(jsonString);
  List<Program> programs = List<Program>.from(
    i.map(
      (e) => Program.fromJson(e),
    ),
  );
  return programs;
}

void savePrograms(List<Program> programs, SoftwareType type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(programs);
  await prefs.setString(
    type == SoftwareType.PROGRAM ? "programs" : "folders",
    jsonString,
  );
}

String getFolderOfAProgram(Program program) {
  List<String> folders = program.path.split('\\');
  String cwd = "";
  for (int i = 0; i < folders.length - 1; i++) {
    cwd += folders[i];
    cwd += '\\';
  }
  return cwd;
}
