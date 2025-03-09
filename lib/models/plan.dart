class Plan {
  String name;
  String description;
  DateTime date;
  bool isCompleted;
  String priority;

  Plan({
    required this.name,
    required this.description,
    required this.date,
    this.isCompleted = false,
    this.priority = "Medium",
  });
}
