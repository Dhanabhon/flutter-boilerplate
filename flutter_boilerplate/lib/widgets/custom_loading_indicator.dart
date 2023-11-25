import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.color, this.value});

  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final progress = (value == null || value! < .05) ? null : value;

    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: CircularProgressIndicator(
        color: color,
        value: progress,
        strokeWidth: 1.0,
      ),
    );
  }
}
