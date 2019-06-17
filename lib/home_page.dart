import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _msg = 'Hello world';

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
            _buildText(),
            _buildPageView(),
            _buildButtonsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: PageView(
            children: <Widget>[
              _buildImage('assets/images/dog1.png'),
              _buildImage('assets/images/dog2.png'),
              _buildImage('assets/images/dog3.png'),
              _buildImage('assets/images/dog4.png'),
              _buildImage('assets/images/dog5.png'),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButton('ok 1', () => _onPressedOk('clicou ok 1')),
        _buildButton('ok 2', () => _onPressedOk('clicou ok 2')),
        _buildButton('ok 3', () => _onPressedOk('clicou ok 3')),
      ],
    );
  }

  Text _buildText() {
    return Text(
      _msg,
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

  Image _buildImage(String image) {
    return Image.asset(
      image,
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

  void _onPressedOk(String s) {
    print(s);
    setState(() {
      _msg = s;
    });
  }
}
