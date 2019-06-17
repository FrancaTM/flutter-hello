import 'package:flutter/material.dart';

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  var _gridOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView & GridView'),
        actions: _getActions(),
      ),
      body: Container(
        child: _buildListView(),
      ),
    );
  }

  _buildListView() {
    List<String> dogs = List.generate(50, (index) {
      return 'assets/images/dog${index % 5 + 1}.png';
    });

    for (String s in dogs) {
      print(s);
    }

    return _gridOn
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return _buildListItem(dogs, index);
            },
          )
        : ListView.builder(
            itemExtent: 250,
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return _buildListItem(dogs, index);
            },
          );
  }

  Widget _buildListItem(List<String> dogs, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(child: _buildImage(dogs[index])),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.black26),
          child: Text(
            'Dog ${index + 1}',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Image _buildImage(String image) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
    );
  }

  List<Widget> _getActions() {
    List<Widget> actions = [];

    if (_gridOn) {
      actions.add(
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {
            setState(() {
              _gridOn = false;
            });
          },
        ),
      );
    } else {
      actions.add(
        IconButton(
          icon: Icon(Icons.grid_on),
          onPressed: () {
            setState(() {
              _gridOn = true;
            });
          },
        ),
      );
    }

    return actions;
  }
}
