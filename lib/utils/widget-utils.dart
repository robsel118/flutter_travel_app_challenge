import 'package:flutter/material.dart';

class WidgetUtils {
  static addClick(Widget childWidget, Function onClick) {
    return GestureDetector(child: childWidget, onTap: onClick);
  }
}
