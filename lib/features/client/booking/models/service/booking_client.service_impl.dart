import 'package:ehelp/core/dto_validations.dart';
import 'package:ehelp/core/new_http/http_client.dart';
import 'package:ehelp/core/new_http/models/client_response.dart';
import 'package:ehelp/features/client/booking/models/entity/book_service.entity.dart';
import 'package:ehelp/features/client/booking/models/service/booking_client.service.dart';
import 'package:intl/intl.dart';

class BookingClientServiceImpl extends BookingClientService {
  BookingClientServiceImpl(this.client);
  final HttpCoreClient client;

  @override
  Future<List<int>> getWorkDays(final int userId) async {
    final ClientResponse response = await client.get(
      'findUserWorkload/$userId',
    );

    return DtoValidation.dynamicToListInt(response.body?['workDays']);
  }

  @override
  Future<List<int>> getWorkHours(int userId, DateTime day) async {
    final ClientResponse response = await client.get(
      'getCalendar/$userId/${DateFormat('yyyy-MM-dd').format(day)}',
    );

    return DtoValidation.dynamicToListInt(response.body?['serviceTime']);
  }

  @override
  Future<ClientResponse> bookService(
    BookService booking,
  ) async {
    final ClientResponse response =
        await client.post('addService', body: booking.toJson());

    return response;
  }
}
