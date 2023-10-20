import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeroo/controller/timer_controller.dart';
import 'package:timeroo/widgets/roundInfo.dart';
import 'package:timeroo/widgets/shared/button.dart';
import 'package:timeroo/widgets/time.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<TimerController>(
        init: TimerController(),
        builder: (controller) => Container(
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RoundInfo(
                      controller.isStopped,
                      controller.isBreak,
                      controller.round.toString()),
                  Time(controller.minutes,
                      controller.seconds.value),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ControlButton(
                            controller.buttonText.value == 'Start' ||
                                    controller.buttonText.value == 'Resume'
                                ? controller.start
                                : controller.pause,
                            controller.buttonText.value,
                            null),
                        ControlButton(controller.prompt, 'Stop', context)
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
