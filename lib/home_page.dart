import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';

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
        _buildButton('ListView', () => _onPressedPage(HelloListView())),
        _buildButton('Page 2', () => _onPressedPage(HelloPage2())),
        _buildButton('Page 3', () => _onPressedPage(HelloPage3())),
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

  _onPressedPage(Widget page) async {
    Future<String> future =
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));

    future.then((s) {
      if (s != null) {
        setState(() {
          _msg = s;
        });
      }
    });
  }
}
