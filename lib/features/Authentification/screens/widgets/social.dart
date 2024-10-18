import 'package:flutter/material.dart';

class Social extends StatelessWidget {
  const Social({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: Image(image: AssetImage(image)),
    );
  }
}
