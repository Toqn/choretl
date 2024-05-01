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
