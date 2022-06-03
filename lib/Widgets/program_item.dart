import 'dart:io';

import 'package:desktop_launcher/Data/program.dart';
import 'package:desktop_launcher/Data/save_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProgramItem extends StatefulWidget {
  final Program program;
  final Function(Program) onDeleteProgram;

  const ProgramItem(
      {Key? key, required this.program, required this.onDeleteProgram})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgramItemState();
}

class _ProgramItemState extends State<ProgramItem> {
  void runProgram() async {
    Directory.current = getFolderOfAProgram(widget.program);
    try {
      Process.run(widget.program.path, []);
      bool mustClose = (await loadSettings()).closeOnRun;
      if (mustClose) {
        await Future.delayed(const Duration(milliseconds: 500));
        exit(0);
      }
    } on Exception catch (_) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(AppLocalizations.of(context)!.programNotExist),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.program.name),
        Text(widget.program.desc),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => runProgram(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green,
                  ),
                ),
                child: Text(AppLocalizations.of(context)!.runProgram),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => {widget.onDeleteProgram(widget.program)},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(255, 0, 0, 1),
                  ),
                ),
                child: Text(AppLocalizations.of(context)!.delete),
              ),
            )
          ],
        )
      ],
    );
  }
}
