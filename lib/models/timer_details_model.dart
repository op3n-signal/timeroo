class TimerDetails {
  int round;
  int minutes;
  int seconds;
  int roundSeconds;
  bool isBreak;
  int breakSeconds;
  bool isStopped;
  bool skip; //determines whether to skip certain sections of code

  TimerDetails(
      {this.round = 1,
      this.minutes = 0,
      this.seconds = 0,
      this.roundSeconds = 5,
      this.isBreak = false,
      this.breakSeconds = 0,
      this.isStopped = true,
      this.skip = false});
}
