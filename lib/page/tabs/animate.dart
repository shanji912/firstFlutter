import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {
  const AnimatePage({Key? key}) : super(key: key);

  @override
  AnimateState createState() => AnimateState();
}

class AnimateState extends State<AnimatePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animate Page"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset("assets/images/logo.png"),
              ),
              RaisedButton(
                child: const Text("显示隐藏"),
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
