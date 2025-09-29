import 'dart:math';

import 'package:flutter/material.dart';

// final coloredSquaresGlobalKeyOne = GlobalKey('one');
// final coloredSquaresGlobalKeyTwo = GlobalKey();

class MyAppGlobalKeySwitchColumnRow extends StatefulWidget {
  const MyAppGlobalKeySwitchColumnRow({super.key});

  @override
  State<MyAppGlobalKeySwitchColumnRow> createState() {
    return _MyAppGlobalKeySwitchColumnRowState();
  }
}

class _MyAppGlobalKeySwitchColumnRowState
    extends State<MyAppGlobalKeySwitchColumnRow> {
  bool isTrue = false;
  final List<ColoredSquare> listOfColoredSquares = [
    ColoredSquare(key: GlobalKey(), text: '1'),
    ColoredSquare(key: GlobalKey(), text: '2'),
  ];

  void switchSquares() {
    setState(() {
      listOfColoredSquares.insert(1, listOfColoredSquares.removeAt(0));
      isTrue = !isTrue;
      debugPrint(listOfColoredSquares[0].key.toString());
      debugPrint(listOfColoredSquares[1].key.toString());
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
        child: isTrue
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listOfColoredSquares,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listOfColoredSquares,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchSquares,
        child: Icon(Icons.swap_horiz_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ColoredSquare extends StatefulWidget {
  const ColoredSquare({super.key, required this.text});
  final String text;

  @override
  State<ColoredSquare> createState() {
    return _ColoredSquareState();
  }
}

class _ColoredSquareState extends State<ColoredSquare> {
  late Color myColor;
  @override
  void initState() {
    myColor = GeneratorColor.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: myColor,
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 48, color: Colors.white),
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
