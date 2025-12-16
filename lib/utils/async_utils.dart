Future<void> wasteTime({required int seconds}) async {
  await Future.delayed(Duration(seconds: seconds));
}
