import 'package:choretl/screens/add_chore_page.dart';
import 'package:choretl/widgets/chore_item.dart';
import 'package:flutter/material.dart';
import '../models/chore.dart';

class ChorePage extends StatefulWidget {
  const ChorePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ChorePage> createState() => _ChorePageState();
}

class _ChorePageState extends State<ChorePage> {
  List<Chore> chores = [];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _addNewChore method below.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the ChorePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
            itemCount: chores.length,
            itemBuilder: (context, index) => ChoreItem(chores[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewChore(context),
        tooltip: 'Add chore',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void toggleChore(Chore chore) {
    setState(() {
      chore.isCompleted = !chore.isCompleted;
    });
  }

  Future<void> _addNewChore(BuildContext context) async {
    final newChore = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddChorePage()));
    if (newChore != null) {
      setState(() {
        chores.add(newChore);
      });
    }
  }
}
