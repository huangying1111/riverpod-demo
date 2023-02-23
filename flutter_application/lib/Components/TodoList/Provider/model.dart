import 'package:flutter/material.dart';

@immutable
class Todo {
  const Todo(
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

@immutable
class Todos {
  const Todos(
      {required this.todoList, required this.value, required this.count});
  final TextEditingController value;
  final List<Todo> todoList;
  final int count;
  Todos copyWith({
    TextEditingController? value,
    List<Todo>? todoList,
    int? count,
  }) {
    return Todos(
        value: value ?? this.value,
        todoList: todoList ?? this.todoList,
        count: count ?? this.count);
  }
}
