import 'package:flutter/material.dart';

class MyAppScrollableList extends StatelessWidget {
  const MyAppScrollableList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

final dataList = List<int>.generate(100, (int index) => index);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'ScrollView',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(data: index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: double.infinity, height: 10);
            },
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.data});

  final int data;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 80),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.pink[200],
      ),
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${dataList[data] + 1}',
              style: TextStyle(fontSize: 36),
            ),
          ),
          Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
