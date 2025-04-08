import 'package:flutter/material.dart';
import 'constants.dart';

class IconDetails extends StatelessWidget {


  final IconData icon;
  final String label;

  IconDetails({required this.icon,required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kTextStyle,
        ),
      ],
    );
  }
}
