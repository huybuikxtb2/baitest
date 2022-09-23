import 'package:flutter/material.dart';



class AppDrawer extends StatelessWidget {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.green,
            title: Text('Hello Firends!!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Manage Products'),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}







