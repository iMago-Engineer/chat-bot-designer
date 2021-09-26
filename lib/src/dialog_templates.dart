import 'package:chat_bot_designer/src/margin_box.dart';
import 'package:flutter/material.dart';

///
class DialogWithOneButton extends StatelessWidget {
  ///
  final String title;

  ///
  final Widget button;

  ///
  final Widget? body;

  ///
  const DialogWithOneButton({
    Key? key,
    required this.title,
    required this.button,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: _defaultDialogShape,
      elevation: _defaultElevation,
      backgroundColor: _defaultBackgroundColor,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: _defaultDialogBoxDecoration,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(title, style: dialogTextStyle(color: Colors.black)),
                  (body != null)
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: body,
                        )
                      : horizontalMargin12(),
                  const Divider(),
                  Row(children: [Expanded(child: button)]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

///
class DialogWithTwoButtons extends StatelessWidget {
  final String title;
  final Widget leftButton;
  final Widget rightButton;
  final Widget? body;

  ///
  const DialogWithTwoButtons({
    Key? key,
    required this.title,
    required this.leftButton,
    required this.rightButton,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Dialog(
        shape: _defaultDialogShape,
        elevation: _defaultElevation,
        backgroundColor: _defaultBackgroundColor,
        child: Container(
            decoration: _defaultDialogBoxDecoration,
            width: screenSize.width * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                horizontalMargin32(),
                Text(
                  title,
                  style: dialogTextStyle(color: Colors.black),
                ),
                horizontalMargin32(),
                if (body != null) body!,
                horizontalMargin28(),
                const Divider(),
                horizontalMargin20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: leftButton,
                    ),
                    verticalMargin28(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: rightButton,
                    )
                  ],
                ),
                horizontalMargin28()
              ],
            )));
  }
}

final _defaultBackgroundColor = Colors.transparent;

final _defaultDialogShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0));

final _defaultDialogBoxDecoration = BoxDecoration(
  color: Colors.white,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.circular(4.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 10.0,
      offset: Offset(0.0, 10.0),
    )
  ],
);

const _defaultElevation = 0.0;

/// dialogTextStyle
TextStyle dialogTextStyle({required Color color}) =>
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);
