import 'package:flutter/material.dart';

class Study2Page extends StatelessWidget {
  const Study2Page({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => SampleAppPageState();
}

class SampleAppPageState extends State<SampleAppPage> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          //进度条显示50%
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
          // 模糊进度条(会执行一个旋转动画)
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              //进度条显示50%，会显示一个半圆
              Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}
