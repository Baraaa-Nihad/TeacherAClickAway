import 'package:eschool_teacher/app/app.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

//
void main() {

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0 ;

  initializeApp();
}
