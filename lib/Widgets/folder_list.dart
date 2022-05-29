import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FolderList extends StatefulWidget {
  const FolderList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [Text("Program")],
      ),
    );
  }
}
