import 'package:flutter/material.dart';
import 'result_page.dart';
import 'constants.dart';
class BottomContainerWidget extends StatelessWidget {


  final String ButtonName;
  final VoidCallback onpressed;

  BottomContainerWidget({required this.ButtonName,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        color: Color(0xFFed4655),
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            ButtonName,
            style: kbottonContainerfontStyle,
          ),
        ),
      ),
    );
  }
}