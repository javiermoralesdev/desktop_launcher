import 'package:desktop_launcher/Widgets/add_program_alert.dart';
import 'package:flutter/material.dart';

class ProgramList extends StatefulWidget {
  const ProgramList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
  void addProgram() {
    showDialog(
      context: context,
      builder: (context) => const AddProgramAlert(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [Text("Programs")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProgram,
        child: const Icon(Icons.add),
      ),
    );
  }
}
