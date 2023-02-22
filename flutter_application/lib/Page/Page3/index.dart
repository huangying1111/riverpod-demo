import 'package:flutter/material.dart';
import 'package:flutter_application/Components/TodoList/Add.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Page3 extends ConsumerWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text('Page3 ADD'),
          ),
        ),
        body: AddTodo());
  }
}
