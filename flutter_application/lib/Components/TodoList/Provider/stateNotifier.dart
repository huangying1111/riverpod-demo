import 'package:flutter/material.dart';
import 'package:flutter_application/Components/TodoList/Provider/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class TodosNotifier extends StateNotifier<Todos> {
  TodosNotifier()
      : super(Todos(
            todoList: const [],
            value: TextEditingController(text: ''),
            count: 1));

  addTodo() {
    final text = state.value.text.trim();
    if (text.isEmpty) return;
    state = state.copyWith(todoList: [
      ...state.todoList,
      Todo(
          title: text,
          id: Random().nextDouble().toString(),
          isCompleted: false,
          createDate: DateTime.now().millisecondsSinceEpoch)
    ]);
    state.value.text = '';
  }

  removeTodo(String id) {
    state = state.copyWith(
        todoList: state.todoList.where((element) => element.id != id).toList());
  }

  completedToggle(String id) {
    state = state.copyWith(todoList: [
      for (final todo in state.todoList)
        if (todo.id == id)
          todo.copyWith(
              isCompleted: !todo.isCompleted,
              finishDate: !todo.isCompleted
                  ? DateTime.now().millisecondsSinceEpoch
                  : null)
        else
          todo,
    ]);
  }

  addCount() {
    state = state.copyWith(count: state.count + 1);
  }
}
