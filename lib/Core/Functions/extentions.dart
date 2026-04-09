import 'package:flutter/material.dart';

extension HeightSized on num {
  SizedBox get h {
    return SizedBox(height: toDouble());
  }
}
extension WidthSized on num {
  SizedBox get w {
    return SizedBox(width: toDouble());
  }
}

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get cardColor => theme.cardColor;
}

// extension Push on BuildContext {
//   void pushTo( Widget newScreen) {
//     Navigator.push(this, MaterialPageRoute(builder: (context) => newScreen));
//   }
// }
