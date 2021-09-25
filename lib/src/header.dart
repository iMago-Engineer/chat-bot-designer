import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';
import 'margin_box.dart';
import 'style_library.dart';

class Header extends ViewModelWidget<HomeViewModel> {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: baseColor,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Icon(Icons.menu, color: iconColor)),
              verticalMargin32(),
              Text(
                'LINE Chat Bot Desingner',
                style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              verticalMargin96(),
              Text('Dashboard', style: TextStyle(color: textColor)),
              verticalMargin28(),
              Text('Dashboard', style: TextStyle(color: textColor)),
              verticalMargin28(),
              Text('Dashboard', style: TextStyle(color: textColor)),
              verticalMargin28(),
              Text('Dashboard', style: TextStyle(color: textColor)),
              verticalMargin28(),
              Text('Dashboard', style: TextStyle(color: textColor)),
            ],
          ),
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.download),
                color: iconColor,
                onPressed: viewModel.downloadChatFlowChart,
              ))
        ],
      ),
    );
  }
}
