import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      elevation: 0,
      child: Text(buttonName),
    );
  }
}
