import 'package:flutter/material.dart';

//
// ボタン
//
// NOTE: 参考サイト
// https://flutter.dev/docs/release/breaking-changes/buttons
//

/// FlatButton が Flutter2 以降使えなくなるので、
/// flatButtonStyle を使って　TextButton で同じ見た目を再現する。
///
/// ```dart
/// TextButton(
///   style: flatButtonStyle(),
///   onPressed: () { },
///   child: Text('Looks like a FlatButton'),
/// );
/// ```
/// 必要に応じて、この関数に変数を加える
ButtonStyle flatButtonStyle({
  Color? backgroundColor,
  Color? textColor,
  double? minHeight,
  double? minWidth,
  EdgeInsetsGeometry? padding,
  OutlinedBorder? shape,
}) {
  final minimumSize = Size(minWidth ?? 88, minHeight ?? 36);

  return TextButton.styleFrom(
    backgroundColor: backgroundColor,
    primary: textColor ?? Colors.black87,
    minimumSize: minimumSize,
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
    shape: shape ??
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
  );
}

/// RaisedButton が Flutter 2 以降使えなくなるので、
/// raisedButtonStyle を使って、ElevatedButton で同じ見た目を再現する。
///
/// ```dart
/// ElevatedButton(
///   style: raisedButtonStyle(),
///   onPressed: () { },
///   child: Text('ElevatedButton with custom foreground/background'),
/// );
/// ```
/// 必要に応じて、この関数に変数を加える
ButtonStyle raisedButtonStyle({
  Color? backgroundColor,
  Color? disabledColor,
  Color? textColor,
  Color? disabledTextColor,
  FontWeight? fontWeight,
  double? minHeight,
  double? minWidth,
  OutlinedBorder? shape,
}) {
  final minimumSize = Size(minWidth ?? 88, minHeight ?? 36);
  final textStyle = TextStyle(
    color: textColor ?? Colors.white,
    fontWeight: fontWeight,
  );

  if (disabledColor == null) {
    // disabledColor が必要ではないボタンのスタイル
    return ElevatedButton.styleFrom(
      primary: backgroundColor ?? Colors.red,
      onPrimary: textColor ?? Colors.white,
      textStyle: textStyle,
      minimumSize: minimumSize,
      shape: shape,
    );
  } else {
    // disabledColor が必要なボタンのスタイル
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(minimumSize),
      textStyle: MaterialStateProperty.all(textStyle),
      // ボタンの背景色
      backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
        return states.contains(MaterialState.disabled)
            ? disabledColor
            : backgroundColor;
      }),
      // ボタンのテキスト、アイコンの色
      foregroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
        // return null でデフォルトの値を使う
        return states.contains(MaterialState.disabled)
            ? disabledTextColor
            : textColor;
      }),
    );
  }
}

/// OutlinedButton が Flutter 2 以降で使い方が変わったので、
/// outlinedButtonStyle を使って、前の OutlinedButton と同じ見た目を再現する。
///
/// ```dart
/// OutlinedButton(
///   style: outlineButtonStyle,
///   onPressed: () { },
///   child: Text('Looks like an OutlineButton'),
/// )
/// ```
/// 必要に応じて、この関数に変数を加える
ButtonStyle outlinedButtonStyle({Color? primaryColor, OutlinedBorder? shape}) {
  return OutlinedButton.styleFrom(
    primary: primaryColor ?? Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: shape ??
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide?>(
      (states) {
        if (states.contains(MaterialState.pressed)) {
          return const BorderSide(color: Color(0xff385546), width: 1);
        }
        return null; // Defer to the widget's default.
      },
    ),
  );
}

//
// フォーム
//

/// ```
/// InputDecoration(
///   hintStyle: hintTextStyle,
/// )
/// ```
const hintTextStyle = TextStyle(fontSize: 14.0, color: Colors.grey);

/// ```
/// InputDecoration(
///   contentPadding: formPadding
/// )
/// ```
final formPadding = EdgeInsets.only(
  left: hintTextStyle.fontSize! * 0.5,
  top: hintTextStyle.fontSize! * 0.25,
  bottom: hintTextStyle.fontSize! * 0.25,
  right: hintTextStyle.fontSize! * 0.5,
);

//
// 部屋・宣言・応援
//

///
const statementVariableTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

///
const completedTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

///
const inCompletedTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.black54);

/// Color Theme

Color baseColor = const Color(0xFFF5F8FA);
Color iconColor = const Color(0xFFC2CBDA);
Color textColor = const Color(0xFF8090AC);
Color titleColor = const Color(0xFF4E5F7D);
Color borderColor = const Color(0xFFECEFF3);
