import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Text('Page 1'),
        ),
      ),
    );
  }
}
