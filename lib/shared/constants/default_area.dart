// ignore_for_file: avoid_classes_with_only_static_members

import '../../features/professional/areas/models/week_days.entity.dart';
import '../../features/professional/areas/models/working_hours.entity.dart';

class DefaultArea {
  static List<WeekDays> workDaysList = <WeekDays>[
    WeekDays(
      dayName: 'Segunda',
      selected: false,
    ),
    WeekDays(
      dayName: 'Terça',
      selected: false,
    ),
    WeekDays(
      dayName: 'Quarta',
      selected: false,
    ),
    WeekDays(
      dayName: 'Quinta',
      selected: false,
    ),
    WeekDays(
      dayName: 'Sexta',
      selected: false,
    ),
    WeekDays(
      dayName: 'Sábado',
      selected: false,
    ),
    WeekDays(
      dayName: 'Domingo',
      selected: false,
    ),
  ];

  static List<WorkingHours> workHoursList = <WorkingHours>[
    WorkingHours(
      hourName: '8:00',
      selected: false,
      isAvaliable: false,
    ),
    WorkingHours(
      hourName: '9:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '10:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '11:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '12:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '13:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '14:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '15:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '16:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '17:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '18:00',
      selected: false,
      isAvaliable: true,
    ),
    WorkingHours(
      hourName: '19:00',
      selected: false,
      isAvaliable: false,
    ),
  ];
}
