import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

import '../../services_locator.dart';
import 'navigation.dart';

/// 画面の下方にメッセージを一定時間表示するサービス
///
/// 表示されるメッセージとその箱を Snackbar というらしい
///
/// static 関数で機能を提供している かつ サービスの初期化がない
/// ので、servicesLocator に登録しない
class SnackbarService {
  /// - `backgroundColor` (default): `primaryColor`
  /// - `duration` (default): `Duration(seconds: 3)`
  static void showSnackBar({
    required String content,
    Color? textColor,
    Color? backgroundColor,
    Duration? duration,
  }) {
    final currentContext = servicesLocator<NavigationService>().currentContext!;

    Flushbar(
      messageText: Text(
        content,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
      backgroundColor: backgroundColor ?? Theme.of(currentContext).primaryColor,
      maxWidth: MediaQuery.of(currentContext).size.width * 0.8,
      margin: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      duration: duration ?? const Duration(seconds: 3),
    ).show(currentContext);
  }

  /// エラーメッセージを Snackbar で表示する
  static void showSnackbarWithErrorMessage(String errorMessage) {
    SnackbarService.showSnackBar(
      content: errorMessage,
      backgroundColor: Colors.red,
    );
  }
}
