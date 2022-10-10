import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取路由传参
    Map args= ModalRoute.of(context)?.settings.arguments as Map;


    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body:
        Column(
          children: <Widget>[
            Text("我是Detail页面"),
            Text("id:${args['id']}" ),
            Text("id:${args['title']}"),
            Text("id:${args['subtitle']}")
          ],
        )
    );
  }
}