import 'package:mobx/mobx.dart';

class WeekDays {
  WeekDays({required this.dayName, required this.selected});
  String dayName;
  @observable
  bool selected;
}
