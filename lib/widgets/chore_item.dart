import 'package:flutter/material.dart';
import '../models/chore.dart';

class ChoreItem extends StatelessWidget {
  final Chore chore;
  const ChoreItem(this.chore, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chore.name),
      subtitle: Text(chore.description ?? ''),
    );
  }
}
