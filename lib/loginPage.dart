import 'package:demoapp/homePage.dart';
import 'package:demoapp/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  static const routeName ="/Login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: new  Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/bg.jpg",
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.7),
          colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child:Form(
                  key: formkey,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              labelText: "Username",
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          RaisedButton(
                              child: Text("LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                              color: Colors.pink,
                              onPressed:()
                              {
                               Constants.prefs.setBool("LoggedIn", true);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder:(context)=>HomePage()));
                                
                                Navigator.pushReplacementNamed(context, HomePage.routeName);
                           },
                          ),
                        ],
                      ),
                    ),
                  ),

                ),

              ),
            ),
          ),
        ],
      )
    );
  }
}
