import 'package:flutter/material.dart';
import 'package:flutter_hello/drawer_list.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _msg = 'Hello world';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Tab 1', icon: Icon(Icons.map)),
              Tab(text: 'Tab 2', icon: Icon(Icons.star)),
              Tab(text: 'Tab 3', icon: Icon(Icons.cake)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Builder(builder: (context) {
              return _buildBody(context);
            }),
            Container(color: Colors.purple),
            Container(color: Colors.purpleAccent),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('adicionar');
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      child: Center(
//        child: SizedBox.expand(child: _buildImage()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildText(),
            _buildPageView(),
            _buildButtonsRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 220,
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

  Column _buildButtonsRow(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('ListView', () => _onPressedPage(HelloListView())),
            _buildButton('Page 2', () => _onPressedPage(HelloPage2())),
            _buildButton('Page 3', () => _onPressedPage(HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('Snack', () => _onPressedSnack(context)),
            _buildButton('Dialog', () => _onPressedDialog(context)),
            _buildButton('Toast', () => _onPressedToast()),
          ],
        ),
      ],
    );
  }

  Text _buildText() {
    return Text(
      _msg,
      style: TextStyle(
        fontSize: 20.0,
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
          fontSize: 18.0,
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

  _onPressedSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Apenas um teste'),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.purpleAccent,
          onPressed: () {
            print('OK!');
          },
        ),
      ),
    );
  }

  _onPressedToast() {
    Fluttertoast.showToast(
      msg: "This is Center Long Toast",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 5,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  _onPressedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert dialog test'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: Text('Cancelar'),
            ),
            FlatButton(
              onPressed: () {
                print('ok');
                Navigator.of(context).pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
