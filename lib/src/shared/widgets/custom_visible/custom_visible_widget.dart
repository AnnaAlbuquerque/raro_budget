import 'package:flutter/material.dart';

class VisibleWidget extends StatelessWidget {
  final bool visible;
  final void Function() onPressed;

  const VisibleWidget({
    Key? key,
    required this.visible,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        visible ? Icons.lock_outlined : Icons.lock_open_outlined,
      ),
      onPressed: onPressed,
    );
  }
}
