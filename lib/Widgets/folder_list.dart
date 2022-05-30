import 'package:flutter/material.dart';

class FolderList extends StatefulWidget {
  const FolderList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  void addProgram() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Carpeta añadido"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [Text("Folders")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProgram,
        child: const Icon(Icons.add),
      ),
    );
  }
}
