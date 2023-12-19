import 'package:get/get.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find<SettingsController>();

  bool isActive = false;
  RxInt warmup = 30.obs;
  RxInt maxRounds = 12.obs;
  RxInt minutesPerRound = 3.obs;
  RxInt secondsPerBreak = 60.obs;

}