import 'package:flutter/material.dart';


class NameCard extends StatelessWidget {
  const NameCard({
    Key key,
    @required this.myText,
    @required TextEditingController nameController,
  }) : _nameController = nameController, super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset("assets/bg.jpg"),
          SizedBox(height: 20,),
          Text(myText,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold ),),
          SizedBox(height: 20,),

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Enter Name",
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
