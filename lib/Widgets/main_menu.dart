import 'package:desktop_launcher/Widgets/folder_list.dart';
import 'package:desktop_launcher/Widgets/program_list.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int selectedIndex = 0;
  static const List<Widget> options = [ProgramList(), FolderList()];
  void selectList(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desktop Launcher"),
      ),
      body: options.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) => selectList(val),
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Folder',
          )
        ],
      ),
    );
  }
}