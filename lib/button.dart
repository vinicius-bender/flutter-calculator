import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function btnCallback;

  const ButtonWidget({Key? key, required this.text, required this.btnCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => btnCallback(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey,
          fixedSize: const Size(70, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          text, style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
