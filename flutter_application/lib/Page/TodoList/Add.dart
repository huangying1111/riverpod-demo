import 'package:flutter/material.dart';
import 'package:flutter_application/Page/TodoList/Provider/createProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final TextEditingController _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(controller: _controller),
        ),
        TextButton(
          onPressed: () => _onPressed(),
          child: Text('新 增'),
        )
      ],
    );
  }

  _onPressed() async {
    ref.read(todosProvider.notifier).addTodo(_controller.text);
    _controller.text = '';
  }
}
