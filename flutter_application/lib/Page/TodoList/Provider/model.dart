class Todo {
  Todo(
      {required this.title,
      required this.id,
      required this.isCompleted,
      required this.createDate,
      this.finishDate});
  final bool isCompleted;
  final String title;
  final String id;
  final int createDate;
  final int? finishDate;

  Todo copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    int? createDate,
    int? finishDate,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createDate: createDate ?? this.createDate,
      finishDate: finishDate ?? this.finishDate,
    );
  }
}
