import 'package:flutter/material.dart';

class CustomFailureBody extends StatelessWidget {
  const CustomFailureBody({
    super.key,
    required this.errorMessage,
    this.height,
    required this.padding,
  });
  final String errorMessage;
  final double? height;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        child: Center(
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
