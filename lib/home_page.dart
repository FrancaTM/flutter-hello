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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildImage(),
            _buildText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton('ok 1', () => print('clicou ok 1')),
                _buildButton('ok 2', () => print('clicou ok 2')),
                _buildButton('ok 3', () => print('clicou ok 3')),
              ],
            ),
          ],
        ),
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

  RaisedButton _buildButton(String s, Function onPressedOk) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: onPressedOk,
      child: Text(
        '$s',
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
