import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(20.0),
        ));
  }
}
