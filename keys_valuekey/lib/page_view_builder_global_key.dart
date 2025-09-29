import 'package:flutter/material.dart';

class MyAppGlobalKeyPageViewBuilder extends StatelessWidget {
  MyAppGlobalKeyPageViewBuilder({super.key});

  final GlobalKey<_FooState> _gKey = GlobalKey<_FooState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Global Key Demo")),
      body: PageView.builder(
        ,
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Container(color: Colors.green[100], child: Foo(_gKey));
            case 1:
              return Container(
                color: Colors.blue[100],
                child: Text("Blank Page"),
              );
            case 2:
              return Container(color: Colors.red[100], child: Foo(_gKey));
            default:
              throw "404";
          }
        },
      ),
    );
  }
}

class Foo extends StatefulWidget {
  const Foo(Key key) : super(key: key);

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  late bool _switchValue;
  late double _sliderValue;

  @override
  void initState() {
    final widgetKey = widget.key;
    debugPrint(widgetKey.toString());
    _switchValue = false;
    _sliderValue = 0.5;
    super.initState();
  }

  void onSwitch(bool v) {
    setState(() {
      _switchValue = v;
    });
  }

  void onSlide(double v) {
    setState(() {
      _sliderValue = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(value: _switchValue, onChanged: onSwitch),
        Slider(value: _sliderValue, onChanged: onSlide),
      ],
    );
  }
}
