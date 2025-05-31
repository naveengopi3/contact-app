import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool? isLoading;
  final ButtonStyle? style;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
    this.style,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(text),
      ),
    );
  }
}
