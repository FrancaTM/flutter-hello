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
//        child: SizedBox.expand(child: _buildImage()),
        child: _buildButton(),
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

  Image _buildImage() {
    return Image.asset(
      'assets/images/dog4.png',
      fit: BoxFit.cover,
    );
  }

  RaisedButton _buildButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: _onPressedOk,
      child: Text(
        'ok',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onPressedOk() {
    print('botao ok pressionado');
  }
}
