import 'package:flutter/material.dart';

import 'common/net/net_dio.dart';
import 'page/tabs/animate.dart';
import 'page/animate2.dart';
import 'page/tabs/button.dart';
import 'page/detail.dart';
import 'page/flex.dart';
import 'page/gsy1.dart';
import 'page/tabs/list.dart';
import 'page/listview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "ListPage": (context) => const ListPage(),
        "Page2": (context) => ListViewPage(),
        "DetailPage": (context) => DetailPage(),
        "Button": (context) => ButtonPage(),
        "Flex": (context) => FlexLayoutPage(),
        "Animate": (context) => AnimatePage(),
        "Animate2": (context) => Animate2Page(),
        "GSY1": (context) => GSY1Page()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var msg = "Hello World"; //msg默认文字
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("我是Title"),
        ),
        body: Center(
            child: Column(children: <Widget>[
          RaisedButton(
            child: const Text("Clikc to Animate"),
            onPressed: () {
              print("aassssssss");
              //根据命名路由做跳转
              // Navigator.pushNamed(context, "Animate2");
              DioNet dioNet = DioNet();
              print(dioNet.getByDio());
            },
          ),
          RaisedButton(
            child: const Text("Click to flex"),
            onPressed: () {
              //根据命名路由做跳转
              Navigator.pushNamed(context, "GSY1");
            },
          ),
          Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(left: 150, top: 0, right: 0, bottom: 0),
              child: const Text("Hello Container ", style: TextStyle(fontSize: 20, color: Colors.white))),
          const Image(
            image: NetworkImage("https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png"),
            // image: AssetImage("assets/images/logo.png"),
            width: 200.0,
          ),
          Container(
              color: Colors.blue,
              width: 300,
              height: 200,
              child: const Align(
                alignment: Alignment.center,
                child: Text("Hello Align ", style: TextStyle(fontSize: 20, color: Colors.white)),
              )),
          Stack(
            children: <Widget>[
              Image.network("https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png"),
              Positioned(top: 20, right: 10, child: Image.asset("assets/images/logo.png", width: 200.0))
            ],
          )
        ])));
  }
}
