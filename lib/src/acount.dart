import 'package:chat_bot_designer/src/style_library.dart';
import 'package:flutter/material.dart';

import 'margin_box.dart';

class Acount extends StatelessWidget {
  const Acount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: baseColor,
      width: screenSize.width * 0.25,
      height: screenSize.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // horizontalMargin96(),
          Text(
            'Acount',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: titleColor),
          ),
          horizontalMargin48(),
          Icon(
            Icons.account_circle,
            size: 120,
            color: iconColor,
          ),
          horizontalMargin48(),
          Text(
            'NAME',
            style: TextStyle(fontSize: 17, color: textColor),
          ),
          horizontalMargin16(),
          Text(
            'e-mail',
            style: TextStyle(fontSize: 15, color: textColor),
          ),
          // horizontalMargin96(),
        ],
      ),
    );
  }
}
