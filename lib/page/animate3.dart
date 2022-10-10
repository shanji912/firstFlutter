import 'package:flutter/material.dart';

class Animate3Page extends StatefulWidget {
  const Animate3Page({Key? key}) : super(key: key);

  _AnimatePage createState() => _AnimatePage();
}

class _AnimatePage extends State<Animate3Page> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animate Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController), // 从灰色变成蓝色
                  value: _animationController.value,
                ),
              ),
            ],
          ),
        ));
  }
}
