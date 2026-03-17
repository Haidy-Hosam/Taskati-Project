import 'package:flutter/material.dart';

extension HeightSized on num {
  SizedBox get h {
    return SizedBox(height: toDouble());
  }
}
extension widthSized on num {
  SizedBox get w {
    return SizedBox(width: toDouble());
  }
}

// extension Push on BuildContext {
//   void pushTo( Widget newScreen) {
//     Navigator.push(this, MaterialPageRoute(builder: (context) => newScreen));
//   }
// }
