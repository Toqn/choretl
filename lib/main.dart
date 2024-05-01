import 'package:flutter/material.dart';

const appName = 'chore.tl';

void main() {
  runApp(const ChoreApp());
}

class ChoreApp extends StatelessWidget {
  const ChoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ChorePage(title: appName),
    );
  }
}

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
            itemBuilder: (context, index) => _choreItem(chores[index])),
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

  Widget _choreItem(Chore chore) {
    return ListTile(
      title: Text(chore.name),
      subtitle: Text(chore.description ?? ''),
    );
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

class Chore {
  final String name;
  late String owner;
  String? description;
  bool isCompleted = false;

  Chore(this.name, {this.description});

  void assignOwner(String owner) {
    this.owner = owner;
  }
}

class AddChorePage extends StatefulWidget {
  @override
  _AddChorePageState createState() => _AddChorePageState();
}

class _AddChorePageState extends State<AddChorePage> {
  String choreName = '';
  String choreDescription = '';

  // Function to handle form submission (saving the new chore)
  void _saveChore() {
    if (choreName.isEmpty) {
      return; // Handle empty chore name (e.g., show an error message)
    }
    // Create a new Chore object with captured details
    final newChore = Chore(choreName, description: choreDescription);
    Navigator.pop(context, newChore); // Close the page and return the new chore
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Chore'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Chore Name'),
              onChanged: (value) => setState(() => choreName = value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description (Optional)'),
              onChanged: (value) => setState(() => choreDescription = value),
            ),
            ElevatedButton(
              onPressed: _saveChore,
              child: Text('Save Chore'),
            ),
          ],
        ),
      ),
    );
  }
}
