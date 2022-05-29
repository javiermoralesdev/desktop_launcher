import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgramList extends StatefulWidget {
  const ProgramList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [Text("Program")],
      ),
    );
  }
}
