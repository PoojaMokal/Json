import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: [

          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            accountName: Text('Pooja Mokal'),
            accountEmail: Text('mokalpooja380@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Pooja Mokal"),
            subtitle: Text("Developer"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("mokalpooja380@gmail.com"),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
