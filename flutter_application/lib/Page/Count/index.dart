import 'package:flutter/material.dart';
import 'package:flutter_application/Components/PageButton/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Count extends ConsumerWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          title: Text('Count'),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return PageButton();
        },
      ),
    );
  }
}
