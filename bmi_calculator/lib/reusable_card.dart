import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color kolor;
  final Widget cardChild;
  ReusableCard({required this.kolor, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kolor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
