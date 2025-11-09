import 'package:flutter/material.dart';

class SizeBoxWidght extends StatelessWidget {
  const SizeBoxWidght({super.key, this.width, this.height});
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0.0,
      height: height ?? 0.0,
    );
  }
}
