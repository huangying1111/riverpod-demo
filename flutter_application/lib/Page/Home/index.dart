import 'package:flutter/material.dart';
import 'package:flutter_application/Page/TodoList/Add.dart';
import 'package:flutter_application/Page/TodoList/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text('Home'),
          ),
        ),
        body: TodoList());
  }
}
