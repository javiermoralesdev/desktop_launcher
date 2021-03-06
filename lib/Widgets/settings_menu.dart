import 'package:desktop_launcher/Data/save_system.dart';
import 'package:desktop_launcher/Data/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsMenu> {
  bool closeOnRun = false;

  void changeCloseOnRun(bool value) {
    setState(() {
      closeOnRun = value;
      saveSettings(SettingsData(closeOnRun));
    });
  }

  @override
  void initState() {
    super.initState();
    reloadSettings();
  }

  void reloadSettings() async {
    SettingsData data = await loadSettings();
    setState(() {
      closeOnRun = data.closeOnRun;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: closeOnRun,
                onChanged: (value) => changeCloseOnRun(value!),
              ),
              Text(AppLocalizations.of(context)!.exitOnRun)
            ],
          ),
        ],
      ),
    );
  }
}
