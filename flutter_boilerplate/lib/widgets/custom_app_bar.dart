import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.titleText});

  final String titleText;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.titleText),
      actions: const [],
    );
  }

  // final Widget _BrightnessButton = Tooltip(
  //   preferBelow: true,
  //   message: 'Toggle brightness',
  //   child: IconButton(
  //     icon: Theme.of(context).brightness == Brightness.light
  //         ? const Icon(Icons.dark_mode_outlined)
  //         : const Icon(Icons.light_mode_outlined),
  //     onPressed: () {},
  //   ),
  // );
}
