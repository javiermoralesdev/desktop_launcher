import 'package:desktop_launcher/Widgets/program_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desktop Launcher"),
        actions: [
          IconButton(
            onPressed: () => {Navigator.pushNamed(context, '/settings')},
            icon: const Icon(Icons.settings),
            tooltip: AppLocalizations.of(context)!.settings,
          )
        ],
      ),
      body: const ProgramList(),
    );
  }
}
