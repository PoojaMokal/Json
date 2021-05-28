import 'package:demoapp/loginPage.dart';
import 'package:demoapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/drawer.dart';
import 'widgets/nameCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePageFB extends StatelessWidget {

  Future fetchData() async {
    final url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(url);
    var data = jsonDecode(res.body);
     return data;
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
      body: FutureBuilder(
        future: fetchData(),
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Text("Fetch something"),);
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if(snapshot.hasError){
                return Center(
                  child: Text("Some Error occured"),
                );
              }
          return  ListView.builder(
            itemBuilder: (context,index){
              return ListTile(
                title: Text(snapshot.data[index]['title']),
                subtitle: Text('ID :${snapshot.data[index]['id']}'),
                leading: Image.network(snapshot.data[index]['url']),
              );
            },
            itemCount: snapshot.data.length,
          );

          }
        },
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
