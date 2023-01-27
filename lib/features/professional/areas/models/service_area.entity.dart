import 'package:ehelp/features/professional/areas/models/week_days.entity.dart';
import 'package:ehelp/features/professional/areas/models/working_hours.entity.dart';

class ServiceAreaEntity {
  ServiceAreaEntity({
    required this.nameArea,
    required this.weekDays,
    required this.workingHours,
    required this.paymentValue,
  });

  String nameArea;
  List<WeekDays> weekDays;
  List<WorkingHours> workingHours;
  double paymentValue;
}
