import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter'),
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      child: Center(
        child: _buildText(),
      ),
    );
  }

  Text _buildText() {
    return Text(
        'Hello world',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.wavy,
          decorationColor: Colors.red,
        ),
      );
  }
}
