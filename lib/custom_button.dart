import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String title;
  Function onPressed;

  CustomButton({@required this.title, @required this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.blueAccent,
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: widget.onPressed,
    );
  }
}
