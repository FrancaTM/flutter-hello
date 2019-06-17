import 'package:flutter/material.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text('Page 3'),
        ),
      ),
    );
  }
}
