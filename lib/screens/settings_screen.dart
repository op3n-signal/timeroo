import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeroo/controller/settings_controller.dart';
import 'package:timeroo/controller/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SettingsController>(builder: (controller) {
      final warmup = controller.warmup.value;
      final maxRound = controller.maxRounds.value;
      final minutesPerRound = controller.minutesPerRound.value;
      final secondsPerBreak = controller.secondsPerBreak.value;
      final darkTheme = ThemeController.to.isDark.value;

      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You can configure your own settings here.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                child: Column(
              children: [
                Text(
                  'Warmup seconds: ' + warmup.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Slider(
                  min: 10,
                  max: 60,
                  divisions: 5,
                  value: double.parse(warmup.toString()),
                  onChanged: (value) => controller.warmup.value = value.round(),
                ),
              ],
            )),
            SizedBox(
              height: 15,
            ),
            Container(
                child: Column(
              children: [
                Text(
                  'Rounds: ' + maxRound.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Slider(
                  min: 1,
                  max: 20,
                  divisions: 20,
                  value: double.parse(maxRound.toString()),
                  onChanged: (value) =>
                      controller.maxRounds.value = value.round(),
                ),
              ],
            )),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Minutes Per Round: ' + minutesPerRound.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Slider(
                    min: 1,
                    max: 10,
                    divisions: 10,
                    value: double.parse(minutesPerRound.toString()),
                    onChanged: (value) =>
                        controller.minutesPerRound.value = value.round(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Seconds Per Break: ' + secondsPerBreak.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Slider(
                    min: 10,
                    max: 60,
                    divisions: 5,
                    value: double.parse(secondsPerBreak.toString()),
                    onChanged: (value) =>
                        controller.secondsPerBreak.value = value.round(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enable Dark Mode',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Switch(
                    value: darkTheme,
                    onChanged: (isOn) => ThemeController.to.isDark.value = isOn,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Settings are automatically saved. \nYou may navigate back to the timer anytime.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
