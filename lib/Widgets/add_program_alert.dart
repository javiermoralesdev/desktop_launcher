import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProgramAlert extends StatefulWidget {
  const AddProgramAlert({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddProgramAlertState();
}

class _AddProgramAlertState extends State<AddProgramAlert> {
  TextEditingController nameController = TextEditingController();
  TextEditingController editControllerController = TextEditingController();
  TextEditingController pathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Program's name",
            ),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Program's path",
            ),
          ),
        ],
      ),
    );
  }
}
