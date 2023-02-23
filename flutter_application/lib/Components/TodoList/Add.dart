import 'package:flutter/material.dart';
import 'package:flutter_application/Components/TodoList/Provider/createProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodo extends ConsumerWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: TextField(controller: ref.watch(todosProvider).value),
        ),
        TextButton(
          onPressed: () {
            // addTodo(_controller.text);
            ref.read(todosProvider.notifier).addTodo();
          },
          child: const Text('新 增'),
        ),
        TextButton(
          onPressed: () {
            // addTodo(_controller.text);
            ref.read(todosProvider.notifier).addCount();
          },
          child: const Text('新 增 count'),
        ),
        TextButton(
          onPressed: () => ref.refresh(todosProvider),
          child: const Text('重 置'),
        )
      ],
    );
  }
}
