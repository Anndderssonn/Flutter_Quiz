import 'package:flutter/widgets.dart';

class AppBackground {
  BoxDecoration background() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF3F51B5), Color(0xFF2196F3)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
