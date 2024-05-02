import 'package:flutter/material.dart';
import '../models/chore.dart';

class AddChorePage extends StatefulWidget {
  const AddChorePage({Key? key}) : super(key: key);

  @override
  AddChorePageState createState() => AddChorePageState();
}

class AddChorePageState extends State<AddChorePage> {
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
        title: const Text('Add Chore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Chore Name'),
              onChanged: (value) => setState(() => choreName = value),
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Description (Optional)'),
              onChanged: (value) => setState(() => choreDescription = value),
            ),
            ElevatedButton(
              onPressed: _saveChore,
              child: const Text('Save Chore'),
            ),
          ],
        ),
      ),
    );
  }
}
