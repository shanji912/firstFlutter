import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Button Page"),
        ),
        body: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("我是 RaiseButton" ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("我是 FlatButton" ),
                color: Colors.blue,
                onPressed: () {},
              ),
              OutlinedButton(
                child: Text("我是 OutlineButton" ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              )
            ]
        )
    );
  }
}