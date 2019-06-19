import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: 350,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Túlio Marcos'),
              accountEmail: Text('teste@teste.com.br'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dog1.png')),
            ),
            ListTile(
              onTap: () {
                print('item 1');
              },
              title: Text('Item 1', style: TextStyle(color: Colors.white)),
              subtitle: Text('Apenas um teste 1',
                  style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.star, color: Colors.white),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
            ),
            ListTile(
              onTap: () {
                print('item 2');
              },
              title: Text('Item 2', style: TextStyle(color: Colors.white)),
              subtitle: Text('Apenas um teste 2',
                  style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.star, color: Colors.white),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
            ),
            ListTile(
              onTap: () {
                print('item 3');
              },
              title: Text('Item 3', style: TextStyle(color: Colors.white)),
              subtitle: Text('Apenas um teste 3',
                  style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.star, color: Colors.white),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
