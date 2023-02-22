import 'package:flutter/material.dart';
import 'package:flutter_application/Page/Count/index.dart';
import 'package:flutter_application/Page/Page1/index.dart';
import 'package:flutter_application/Page/Page2/index.dart';
import 'package:flutter_application/Page/Page3/index.dart';

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
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Page1();
                  }),
                );
              },
              child: Text('Page1')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Page2();
                  }),
                );
              },
              child: Text('Page2')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Page3();
                  }),
                );
              },
              child: Text('Page3')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Count();
                  }),
                );
              },
              child: Text('count'))
        ],
      ),
    );
  }
}
