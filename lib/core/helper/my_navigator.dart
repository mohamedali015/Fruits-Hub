import 'package:get/get.dart';

abstract class MyNavigator {
  static goTo({
    required screen,
    bool isReplace = false,
    Transition transition = Transition.topLevel,
    Duration? duration,
  }) {
    if (isReplace) {
      Get.offAll(
        screen,
        transition: transition,
        duration: duration ?? Duration(milliseconds: 300),
      );
    } else {
      Get.to(
        screen,
        transition: transition,
        duration: duration ?? Duration(milliseconds: 300),
      );
    }
  }

  static pop() {
    Get.back();
  }
}
