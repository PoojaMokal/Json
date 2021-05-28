import 'package:demoapp/loginPage.dart';
import 'package:demoapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/drawer.dart';
import 'widgets/nameCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  static const routeName ="/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var myText ="Chnage my Name";
  // TextEditingController _nameController = TextEditingController();

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json "),
          actions: [
            IconButton(
                onPressed: (){
                  Constants.prefs.setBool("LoggedIn", false);
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                  },
                icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: data != null ?
        ListView.builder(
          itemBuilder: (context,index){
            return ListTile(
              title: Text(data[index]['title']),
              subtitle: Text('ID :${data[index]['id']}'),
              leading: Image.network(data[index]['url']),
            );
          },
          itemCount: data.length,
        )
            :Center(
        child: CircularProgressIndicator(),
    ),

    drawer: MyDrawer(),
    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.send),
    onPressed:(){
    // myText=_nameController.text;
    // setState(() {
    //
    // });
    },
    )
    ,
    );
  }
}
