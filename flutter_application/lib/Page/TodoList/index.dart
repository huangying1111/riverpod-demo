import 'package:flutter/material.dart';
import 'package:flutter_application/Page/TodoList/Add.dart';
import 'package:flutter_application/Page/TodoList/ListItem.dart';
import 'package:flutter_application/Page/TodoList/Provider/computed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodos = getCompletedTodos(ref);
    final notCompletedTodos = getNotCompletedTodos(ref);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        AddTodo(),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text('未完成'),
                Expanded(
                    child: ListView.builder(
                  itemCount: notCompletedTodos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(todo: notCompletedTodos[index]);
                  },
                ))
              ],
            )),
            Expanded(
                child: Column(children: [
              Text('已完成'),
              Expanded(
                  child: ListView.builder(
                itemCount: completedTodos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(todo: completedTodos[index]);
                },
              ))
            ])),
          ],
        ))
      ]),
    );
  }
}
