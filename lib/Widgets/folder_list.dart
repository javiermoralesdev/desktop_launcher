import 'dart:io';

import 'package:desktop_launcher/Data/program.dart';
import 'package:desktop_launcher/Data/save_system.dart';
import 'package:desktop_launcher/Widgets/add_program_alert.dart';
import 'package:desktop_launcher/Widgets/folder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FolderList extends StatefulWidget {
  const FolderList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  List<Program> folders = [];

  @override
  void initState() {
    super.initState();
    initFolders();
  }

  void initFolders() async {
    List<Program> tmp = await loadPrograms(SoftwareType.FOLDER);
    setState(() {
      folders = tmp;
    });
  }

  void addFolderToList(String name, String desc, String path) {
    bool folderExists = Directory(path).existsSync();
    if (!folderExists) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(
            AppLocalizations.of(context)!.folderNotExist,
          ),
        ),
      );
    } else {
      setState(() {
        folders.add(
          Program(name, desc, path),
        );
        savePrograms(folders, SoftwareType.FOLDER);
      });
    }
  }

  void addProgram() {
    showDialog(
      context: context,
      builder: (ctx) => AddProgramAlert(
        onAddProgram: addFolderToList,
        type: SoftwareType.FOLDER,
      ),
    );
  }

  void deleteFolder(Program program) {
    setState(() {
      folders.remove(program);
    });
    savePrograms(folders, SoftwareType.FOLDER);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: folders.isEmpty
          ? const NoFolders()
          : Center(
              child: Column(
                children: [
                  for (var i in folders)
                    FolderItem(
                      program: i,
                      onDeleteProgram: deleteFolder,
                    )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProgram,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoFolders extends StatelessWidget {
  const NoFolders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Icon(Icons.folder),
        Text(AppLocalizations.of(context)!.noFolders)
      ],
    ));
  }
}
