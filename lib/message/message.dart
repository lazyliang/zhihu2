import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageState();
  }
}

class MessageState extends State<Message> {

  int _count = 0;

  final List<String> items = new List<String>.generate(10000,  (i) => "用户 $i"+"                         "
      "                                           "+"$i 元");

  MessageInfo _indexList = messages[0];

  List<Widget> children = const <Widget>[];

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('你确定缴纳罚款嘛'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
//                Text('You will never be satisfied.'),
//                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _add(){
_count ++;
print('$_count');
  }

  void _remove(){
    _count--;
    print('$_count');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text("罚款名单"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _remove,)
        ],
      ),
      body:
               new ListView.builder(
                 itemCount: items.length,
                 itemBuilder: (context, index){
                   return new ListTile(
                     title: new Text('${items[index]}'),
                     onTap: _neverSatisfied,
                   );
                 },
               )
//        padding: const EdgeInsets.all(8.0),
//        margin: const EdgeInsets.all(150.0),
//        child: new CircleAvatar(
//          backgroundColor: Colors.green,
//          backgroundImage: new NetworkImage(
//              "http://61.183.131.9/image/group1/M00/00/00/rBB4BlyRmIaAIsghAAAjRouHueg127.jpg"),
//        ),
          ),
    );
  }
}

class MessageInfo {
  const MessageInfo({this.name});

  final String name;
}

const List<MessageInfo> messages = <MessageInfo>[
  const MessageInfo(name: 'Car'),
  const MessageInfo(name: 'Bicycle'),
];
