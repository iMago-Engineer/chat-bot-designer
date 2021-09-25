import 'package:chat_bot_designer/src/margin_box.dart';
import 'package:chat_bot_designer/src/style_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Icon(Icons.notifications, color: iconColor))
        ],
      ),
    );
  }
}


          // appBar: AppBar(
          //     elevation: 0,
          //     toolbarHeight: 100,
          //     backgroundColor: baseColor,
          //     leading: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey.withOpacity(0.1),
          //               spreadRadius: 1,
          //               blurRadius: 1,
          //               offset: const Offset(0, 3), // changes position of shadow
          //             ),
          //           ],
          //         ),
          //         child: Icon(Icons.menu, color: iconColor)),
          //     title: const Text(
          //       'LINE Chat Bot Desingner',
          //       style: TextStyle(
          //           color: Color(0xFF4E5F7D), fontWeight: FontWeight.bold),
          //     ),
          //     actions: <Widget>[
          //       // ElevatedButton(
          //       //   child: const Text("ダウンロード"),
          //       //   onPressed: () {
          //       //     String script = createPythonScript(viewModel.jsonReply);
          //       //     downloadFile(script);
          //       //   },
          //       // )
          //       Text('Dashboard', style: TextStyle(color: textColor)),
          //       Text('Dashboard', style: TextStyle(color: textColor)),
          //       Text('Dashboard', style: TextStyle(color: textColor)),
          //       Text('Dashboard', style: TextStyle(color: textColor)),
          //       Text('Dashboard', style: TextStyle(color: textColor)),
          //       Container(
          //           width: 50,
          //           height: 50,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(0.1),
          //                 spreadRadius: 1,
          //                 blurRadius: 1,
          //                 offset:
          //                     const Offset(0, 3), // changes position of shadow
          //               ),
          //             ],
          //           ),
          //           child: Icon(Icons.notifications, color: iconColor))
          //     ]),