import 'package:flutter/material.dart';

//void main() {
//runApp(CampusNav()); //function provided in material.dart
//
//}

void main() => runApp(CampusNav());

//Every widget must extend StatelessWidget ou
//Every widget must have build method and that method must return a Widget
//Flutter provides value for context
class CampusNav extends StatelessWidget {
  void answerQuestion() {
    print('Chosen!');
  }
  
  @override //decorater - overading build method of StatelessWidget (good practise)
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
          AppBar(title: Text('CampusNav'), backgroundColor: Color(0xFF2196F3)),
        body: Column(children: [
        Text('The question!'),
        RaisedButton(
          child: Text('Answer 1'),
          onPressed: answerQuestion,
        ),
        RaisedButton(
          child: Text('Answer 1'),
          onPressed: answerQuestion,
        ),
        RaisedButton(
          child: Text('Answer 1'),
          onPressed: () {print('upss');},
        ),
      ]),
    ));
  }
}
