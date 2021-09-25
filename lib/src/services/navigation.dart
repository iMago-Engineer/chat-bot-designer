import 'package:flutter/material.dart';

class NavigationService {
  /// Navigator を指定するキー
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// currentContext
  /// - context を navigatorKey から取得する
  BuildContext? get currentContext => navigatorKey.currentContext;

  /// currentState
  /// 遷移するための関数の中で navigatorKey.currentState を何回も書いているから、currentState を外に出した
  NavigatorState? get currentState => navigatorKey.currentState;

  /// routeName にページ遷移する (push)
  Future<dynamic> pushNamed({required String routeName, dynamic args}) {
    return currentState!.pushNamed(routeName, arguments: args);
  }

  /// routeName にページ遷移する (今の route が上書きされる　)
  Future<dynamic> pushAndReplace({required String routeName, dynamic args}) {
    return currentState!.pushReplacementNamed(routeName, arguments: args);
  }

  /// routeName にページを遷移するけど、今までの遷移記録を残さない
  Future<dynamic> pushNamedAndRemoveUntil(
      {required String routeName, dynamic args}) {
    return currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }

  /// 一個前の画面に戻る
  void pop([Object? value]) => navigatorKey.currentState!.pop(value);
}
