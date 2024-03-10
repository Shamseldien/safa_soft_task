import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CustomDateFormatter on DateTime {
  String get formatDate {
    final dateAfterFormatter = DateFormat('yyyy/MM/dd').format(this);

    return dateAfterFormatter;
  }
}


extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushScreen(Widget widget) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (context)=>widget));
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}