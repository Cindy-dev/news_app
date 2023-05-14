import 'package:flutter/cupertino.dart';

extension DeviceSize on BuildContext{
  double deviceHeight() => MediaQuery.of(this).size.height;

  double deviceWidth() => MediaQuery.of(this).size.width;

}