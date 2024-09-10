import 'package:flutter/material.dart';

class ErrorIndicator extends StatefulWidget {
  const ErrorIndicator({super.key});

  @override
  State<ErrorIndicator> createState() => _ErrorIndicatorState();
}

class _ErrorIndicatorState extends State<ErrorIndicator> {
  @override
  Widget build(BuildContext context) {
    return Text('Something went wrong !');
  }
}
