import 'package:ehelp/core/new_http/models/client_response.dart';

import '../entity/book_service.entity.dart';

abstract class BookingClientService {
  Future<List<int>> getWorkDays(final int userId);
  Future<List<int>> getWorkHours(final int userId, final DateTime day);
  Future<ClientResponse> bookService(final BookService booking);
}
