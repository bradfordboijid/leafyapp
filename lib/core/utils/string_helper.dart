import 'dart:ui';

class StringHelper {
  // #FFFFFF < colorString format
  // Color format 0xFF + color format
  Color getColorFromString(String rawColorString) {
    String prefix = "0xFF";
    String colorString = rawColorString.replaceFirst(RegExp(r'#'), prefix);
    return Color(int.parse(colorString));
  }
}
