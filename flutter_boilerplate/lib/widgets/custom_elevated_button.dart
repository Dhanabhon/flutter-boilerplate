import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.text,
      this.isFullWidthButton = true,
      required this.onPressed});

  final String text;
  final bool isFullWidthButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ElevatedButton(
          onPressed: () => onPressed(),
          style: (isFullWidthButton)
              ? ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(constraints.maxWidth, 40.h)),
                )
              : null,
          child: Text(text),
        );
      },
    );
  }
}
