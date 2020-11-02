import 'dart:math';
import 'dart:ui';

class Util {
  static Color randomOpaqueColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}
