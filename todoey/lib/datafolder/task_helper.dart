class Task {
  late final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  // Create a Task object from a JSON map
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      isDone: json['isDone'],
    );
  }
  void toggleDone() {
    isDone = !isDone;
  }
}
