


import 'package:flutter/material.dart';

class Light extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LightState();
  }
  
}

class LightState extends State{

  int _counter = 0;

 void changeCount(){
  setState(() {
    _counter++;
  });
   print(_counter);
 }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("智囊团"),
          actions: <Widget>[
          new IconButton(icon: new Icon(Icons.lightbulb_outline), onPressed: changeCount)
        ],),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('您已失败'),
            new Text('$_counter' + '次',
            style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),

      ),
        floatingActionButton: new FloatingActionButton(
    onPressed: changeCount,
    tooltip: 'Increment',
    child: new Icon(Icons.add),

      ),
    )
    );
  }
  
}