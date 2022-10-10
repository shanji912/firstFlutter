import 'package:flutter/material.dart';

class HomePageApp extends StatelessWidget {
  const HomePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("这里也可以添加我们的Widget"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(height: 100, width: 100, color: Colors.green),
              SizedBox(width: 100),
              Container(height: 100, width: 100, color: Colors.green),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 100),
              Container(height: 100, width: 100, color: Colors.black),
              SizedBox(width: 100),
              Container(height: 100, width: 100, color: Colors.black),
            ],
          ),

          Row(
            children: [
              SizedBox(width: 150),
              Container(height: 100, width: 100, color: Colors.yellow),
            ],
          ),

        ],
      ),
    );
  }

}