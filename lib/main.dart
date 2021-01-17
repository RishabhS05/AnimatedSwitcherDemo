import 'package:animated_switcher_demo/second_widget.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'first_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Animated Switcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _myAnimatedWidget = FirstWidget();
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              switchOutCurve: Curves.easeOutCubic,
              switchInCurve: Curves.easeInCubic,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return _getAnimationWidget(
                  index,
                  child,
                  animation,
                );
              },
              child: _myAnimatedWidget,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                title: 'Scale',
                onPressed: () {
                  index = 2;
                  _changeBackground();
                },
              ),
              CustomButton(
                title: 'Rotate',
                onPressed: () {
                  index = 1;
                  _changeBackground();
                },
              ),
              CustomButton(
                title: 'Fade',
                onPressed: () {
                  index = 3;
                  _changeBackground();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void _changeBackground() {
    setState(() {
      _myAnimatedWidget = (_myAnimatedWidget is FirstWidget) ? SecondWidget() : FirstWidget();
    });
  }

  Widget _getAnimationWidget(int index, Widget child, Animation<double> animation) {
    switch (index) {
      case 1:
        return RotationTransition(
          child: child,
          turns: animation,
        );
      case 2:
        return ScaleTransition(
          child: child,
          scale: animation,
        );
      case 3:
        return FadeTransition(
          child: child,
          opacity: animation,
        );
    }
  }
}
