import 'package:desktop_launcher/Data/save_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddProgramAlert extends StatefulWidget {
  const AddProgramAlert(
      {Key? key, required this.onAddProgram, required this.type})
      : super(key: key);

  final SoftwareType type;
  final Function(String name, String desc, String path) onAddProgram;

  @override
  State<StatefulWidget> createState() => _AddProgramAlertState();
}

class _AddProgramAlertState extends State<AddProgramAlert> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController pathController = TextEditingController();

  bool areEmpty() {
    return nameController.text.isEmpty || pathController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.programName,
            ),
            onChanged: (g) => {setState(() {})},
          ),
          TextField(
            controller: descController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.programDesc,
            ),
            onChanged: (g) => {setState(() {})},
          ),
          TextField(
            controller: pathController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.programPath,
            ),
            onChanged: (g) => {setState(() {})},
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: areEmpty()
              ? null
              : () => {
                    widget.onAddProgram(
                      nameController.text,
                      descController.text,
                      pathController.text,
                    ),
                  },
          child: Text(AppLocalizations.of(context)!.addProgram),
        )
      ],
    );
  }
}
