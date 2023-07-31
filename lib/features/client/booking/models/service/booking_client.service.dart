abstract class BookingClientService {
  Future<List<int>> getWorkDays(final int userId);
  Future<List<int>> getWorkHours(final int userId, final DateTime day);
}
