import 'package:flutter/material.dart';


class College extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollegeState();
  }

}

class CollegeState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
     home: new Scaffold(
         appBar: new AppBar(
           title: new Text('大学'),
         ),
       body: new Text('test'),
     )
    );
  }

}