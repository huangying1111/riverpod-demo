import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model.dart';
import 'package:flutter_application/Components/TodoList/Provider/stateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 全局使用同一个provider
final StateNotifierProvider<TodosNotifier, Todos> todosProvider =
    StateNotifierProvider<TodosNotifier, Todos>((ref) => TodosNotifier());

final completedTodosProvider = Provider<List<Todo>>((ref) {
  final List<Todo> todos =
      ref.watch(todosProvider.select((todos) => todos.todoList));
  print('watchselect');

  return todos.where((todo) => todo.isCompleted).toList();
});

final getNotCompletedTodos = Provider<List<Todo>>((ref) {
  final Todos todos = ref.watch(todosProvider);
  print('watchall');
  return todos.todoList.where((todo) => !todo.isCompleted).toList();
});


// @riverpod
// List<Todo> getNotCompletedTodos(WidgetRef ref) {
//   final Todos todos = ref.watch(todosProvider);
//   print('watchall');
//   return todos.todoList.where((todo) => !todo.isCompleted).toList();
// }
