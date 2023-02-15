import 'package:flutter_application/Page/TodoList/Provider/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);
  @override
  List<Todo> build() {
    state = [
      Todo(
          id: Random().nextDouble().toString(),
          title: '111',
          isCompleted: false,
          createDate: DateTime.now().millisecondsSinceEpoch)
    ];
    return state;
  }

  addTodo(String title) {
    state = [
      ...state,
      Todo(
          title: title,
          id: Random().nextDouble().toString(),
          isCompleted: false,
          createDate: DateTime.now().millisecondsSinceEpoch)
    ];
  }

  removeTodo(String id) {
    state = state.where((element) => element.id != id).toList();
  }

  completedToggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(
              isCompleted: !todo.isCompleted,
              finishDate: todo.isCompleted
                  ? DateTime.now().millisecondsSinceEpoch
                  : null)
        else
          todo,
    ];
  }
}
