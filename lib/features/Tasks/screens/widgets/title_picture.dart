import 'package:flutter/material.dart';

class TitlePicture extends StatelessWidget {
  const TitlePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Task Management',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        CircleAvatar(
          child: Icon(
            Icons.person,
            size: 30,
          ),
        ),
      ],
    );
  }
}
