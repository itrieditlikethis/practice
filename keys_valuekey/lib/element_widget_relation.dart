import 'dart:math';

import 'package:flutter/material.dart';

class MainAppElementWidgetRelation extends StatelessWidget {
  const MainAppElementWidgetRelation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> randomColoredSquares;

  @override
  void initState() {
    randomColoredSquares = [ColoredWidget(text: '1'), ColoredWidget(text: '2')];
    super.initState();
  }

  void swapSquares() {
    setState(() {
      randomColoredSquares.insert(1, randomColoredSquares.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget -> element'),
        backgroundColor: ColorScheme.of(context).primary,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomColoredSquares,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: swapSquares,
        child: Icon(Icons.swap_horiz_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ColoredWidget extends StatefulWidget {
  const ColoredWidget({super.key, required this.text});
  final String text;

  @override
  State<ColoredWidget> createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color myColor;
  @override
  void initState() {
    myColor = GeneratorColor.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
      'color: ${myColor.toARGB32()} | EL_hash: ${context.hashCode} | RENDER_hash: ${context.findRenderObject().hashCode}',
    );

    return Container(
      height: 150,
      width: 150,
      color: myColor,
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GeneratorColor {
  static final random = Random();
  static Color get color {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}
