import '../../../../../../core/new_http/http_client.dart';
import 'home_professional.service.dart';

class HomeProfessionalRemoteService extends HomeProfessionalService {
  HomeProfessionalRemoteService(this.client);
  final HttpCoreClient client;

  @override
  Future<bool> setAvaliable(
      {required final int userId, required final int statusId}) async {
    await client.put('setAvaliable',
        body: <String, dynamic>{'userId': userId, 'statusId': statusId});

    return true;
  }
}
