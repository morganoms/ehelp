import 'package:ehelp/core/new_http/steps/handle_error_step.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import 'models/client_request_data.dart';
import 'models/client_response.dart';
import 'steps/handle_response_step.dart';
import 'steps/mount_request_step.dart';
import 'steps/send_request_step.dart';

class HttpClientWorkflow {
  HttpClientWorkflow(
    this.httpClient,
  );

  final Client httpClient;

  Future<ClientResponse> start({
    required final ClientRequestData requestData,
  }) async {
    try {
      debugPrint('[http-client] step => MountRequestStep');
      final ClientRequestData mountedRequestData =
          await MountRequestStep(requestData).toWillRequest();

      debugPrint('[http-client] step => SendRequestStep');
      final Response responseFromClient =
          await SendRequestStep(mountedRequestData).execute(
        httpClient: httpClient,
      );

      debugPrint('[http-client] step => HandleResponseStep');
      final ClientResponse willClientResponse =
          await HandleResponseStep(responseFromClient).toWillClientResponse();

      return willClientResponse;
    } catch (e) {
      throw HandleErrorStep.handleObjectAsError(e);
    }
  }
}
