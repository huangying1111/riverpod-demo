import 'package:flutter_application/Page/TodoList/Provider/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'createProvider.dart';

@riverpod
List<Todo> getCompletedTodos(WidgetRef ref) {
  final List<Todo> todos = ref.watch(todosProvider);
  return todos.where((todo) => todo.isCompleted).toList();
}

@riverpod
List<Todo> getNotCompletedTodos(WidgetRef ref) {
  final List<Todo> todos = ref.watch(todosProvider);
  return todos.where((todo) => !todo.isCompleted).toList();
}
