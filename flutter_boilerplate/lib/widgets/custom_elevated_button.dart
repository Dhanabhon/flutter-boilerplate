import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.text,
      this.isEnabledShadowColor = true,
      required this.onPressed});

  final String text;
  final bool isEnabledShadowColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ElevatedButton(
          onPressed: () => onPressed(),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 16.0)),
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff486284)),
            shadowColor: isEnabledShadowColor
                ? MaterialStateProperty.all<Color>(Colors.grey)
                : null,
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 10;
              return 5;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            animationDuration: const Duration(milliseconds: 200),
            minimumSize: MaterialStateProperty.all<Size>(
                Size(constraints.maxWidth, 64.0)),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16.0)),
          ),
          child: Text(text),
        );
      },
    );
  }
}
