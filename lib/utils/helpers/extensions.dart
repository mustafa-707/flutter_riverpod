import 'package:flutter/widgets.dart';

extension MediaQuiryHelper on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
