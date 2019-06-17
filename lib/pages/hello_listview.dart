import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ListView'),
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

    return ListView.builder(
      itemExtent: 250,
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        return _buildImage(dogs[index]);
      },
    );
  }

  Image _buildImage(String image) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
    );
  }
}
