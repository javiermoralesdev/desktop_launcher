import 'dart:io' as io;

import 'package:desktop_launcher/Data/program.dart';
import 'package:desktop_launcher/Data/save_system.dart';
import 'package:desktop_launcher/Widgets/add_program_alert.dart';
import 'package:desktop_launcher/Widgets/program_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProgramList extends StatefulWidget {
  const ProgramList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
  List<Program> programs = [];

  @override
  void initState() {
    super.initState();
    initPrograms();
  }

  void initPrograms() async {
    List<Program> tmp = await loadPrograms(SoftwareType.PROGRAM);
    setState(() {
      programs = tmp;
    });
  }

  void addProgramToList(String name, String desc, String path) {
    bool fileExists = io.File(path).existsSync();
    print(fileExists);
    String fileExtension = path.split('.').removeLast();
    print(fileExtension);
    fileExists = fileExtension == "exe" || fileExtension == "bat";
    print(fileExists);
    if (!fileExists) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(AppLocalizations.of(context)!.programNotExist),
        ),
      );
    } else {
      setState(() {
        programs.add(Program(name, desc, path));
        savePrograms(programs, SoftwareType.PROGRAM);
      });
      Navigator.pop(context);
    }
  }

  void addProgram() {
    showDialog(
      context: context,
      builder: (context) => AddProgramAlert(
        onAddProgram: addProgramToList,
        type: SoftwareType.PROGRAM,
      ),
    );
  }

  void deleteProgram(Program program) async {
    setState(() {
      programs.remove(program);
    });
    savePrograms(programs, SoftwareType.PROGRAM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: programs.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  for (var program in programs)
                    ProgramItem(
                      program: program,
                      onDeleteProgram: deleteProgram,
                    )
                ],
              ),
            )
          : const NoPrograms(),
      floatingActionButton: FloatingActionButton(
        onPressed: addProgram,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoPrograms extends StatelessWidget {
  const NoPrograms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Icon(Icons.insert_drive_file),
        Text(AppLocalizations.of(context)!.noPrograms),
      ],
    ));
  }
}
