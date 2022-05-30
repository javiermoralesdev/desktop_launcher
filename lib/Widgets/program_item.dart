import 'package:desktop_launcher/Data/program.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProgramItem extends StatefulWidget {
  Program program;

  ProgramItem({Key? key, required this.program}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgramItemState();
}

class _ProgramItemState extends State<ProgramItem> {
  void runProgram() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.program.name),
        Text(widget.program.desc),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => runProgram(),
              child: Text(AppLocalizations.of(context)!.runProgram),
            )
          ],
        )
      ],
    );
  }
}
