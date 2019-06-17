import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Text('Page 2'),
        ),
      ),
    );
  }
}
