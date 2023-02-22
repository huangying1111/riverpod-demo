import 'package:flutter/material.dart';
import 'package:flutter_application/Components/TodoList/Provider/createProvider.dart';
import 'package:flutter_application/Components/TodoList/Provider/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListItem extends ConsumerWidget {
  final Todo todo;
  const ListItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosProviderRead = ref.read(todosProvider.notifier);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Color(0XFFF5F5F9),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.04),
              offset: Offset(0, 8),
              blurRadius: 20,
            ),
          ]),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: todo.isCompleted,
                      onChanged: (e) =>
                          todosProviderRead.completedToggle(todo.id)),
                  Text(todo.title),
                ],
              ),
              if (!todo.isCompleted)
                Text(
                    '创建时间：${DateTime.fromMillisecondsSinceEpoch(todo.createDate).toLocal()}'),
              if (todo.isCompleted && todo.finishDate != null)
                Text(
                    '完成时间：${DateTime.fromMillisecondsSinceEpoch(todo.finishDate!).toLocal()}'),
            ],
          )),
          TextButton(
            onPressed: () => todosProviderRead.removeTodo(todo.id),
            child: const Text('删除'),
          )
        ],
      ),
    );
  }
}
