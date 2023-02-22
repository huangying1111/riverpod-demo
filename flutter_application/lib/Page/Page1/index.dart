import 'package:flutter/material.dart';
import 'package:flutter_application/Components/TodoList/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Page1 extends ConsumerWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text('Page1'),
          ),
        ),
        body: TodoList());
  }
}
