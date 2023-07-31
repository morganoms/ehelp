import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:ehelp/core/dto_validations.dart';
import 'package:ehelp/features/client/booking/models/service/booking_client.service.dart';

import '../../../../../core/http/http_core.dart';
import '../../../../../core/http/http_core_response.dart';

class BookingClientServiceImpl extends BookingClientService {
  BookingClientServiceImpl(this.client);
  final HttpCore client;

  @override
  Future<List<int>> getWorkDays(final int userId) async {
    final HttpCoreResponse response = await client.get(
      'findUserWorkload/$userId',
    );
    final Map<String, dynamic> decodedResponse = json.decode(response.body);

    return DtoValidation.dynamicToListInt(decodedResponse['workDays']);
  }

  @override
  Future<List<int>> getWorkHours(int userId, DateTime day) async {
    final HttpCoreResponse response = await client.get(
      'getCalendar/$userId/${DateFormat('yyyy-MM-dd').format(day)}',
    );
    final Map<String, dynamic> decodedResponse = json.decode(response.body);

    return DtoValidation.dynamicToListInt(decodedResponse['serviceTime']);
  }
}
