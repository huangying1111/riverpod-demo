import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model.dart';
import 'package:flutter_application/Components/TodoList/Provider/stateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 全局使用同一个provider
final StateNotifierProvider<TodosNotifier, List<Todo>> todosProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) => TodosNotifier());

final completedTodosProvider = Provider<List<Todo>>((ref) {
  final List<Todo> todos = ref.watch(todosProvider);
  return todos.where((todo) => todo.isCompleted).toList();
});

@riverpod
List<Todo> getNotCompletedTodos(WidgetRef ref) {
  final List<Todo> todos = ref.watch(todosProvider);
  return todos.where((todo) => !todo.isCompleted).toList();
}
