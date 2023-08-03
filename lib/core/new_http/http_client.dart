import 'package:ehelp/core/new_http/http_client_workflow.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import 'models/client_methods.dart';
import 'models/client_request_data.dart';
import 'models/client_response.dart';

class HttpCoreClient {
  HttpCoreClient({Client? httpClient}) {
    this.httpClient = httpClient ?? http.Client();
    willHttpWorkflow = HttpClientWorkflow(this.httpClient);
  }
  late final Client httpClient;
  late final HttpClientWorkflow willHttpWorkflow;

  Future<void> close() async {
    return willHttpWorkflow.httpClient.close();
  }

  Future<ClientResponse> get(final String path,
          {final Map<String, String>? headers,
          final Map<String, String>? query,
          final int? timeout}) async =>
      willHttpWorkflow.start(
          requestData: ClientRequestData(
              method: ClientMethod.GET,
              path: path,
              headers: headers,
              query: query,
              timeout: timeout));

  Future<ClientResponse> post(final String path,
          {final Map<String, String>? headers,
          final Map<String, String>? query,
          final int? timeout,
          final dynamic body}) async =>
      willHttpWorkflow.start(
          requestData: ClientRequestData(
              method: ClientMethod.POST,
              path: path,
              headers: headers,
              query: query,
              timeout: timeout,
              body: body));

  Future<ClientResponse> put(final String path,
          {final Map<String, String>? headers,
          final Map<String, String>? query,
          final int? timeout,
          final dynamic body}) async =>
      willHttpWorkflow.start(
          requestData: ClientRequestData(
              method: ClientMethod.PUT,
              path: path,
              headers: headers,
              query: query,
              timeout: timeout,
              body: body));

  Future<ClientResponse> patch(final String path,
          {final Map<String, String>? headers,
          final Map<String, String>? query,
          final int? timeout,
          final dynamic body}) async =>
      willHttpWorkflow.start(
          requestData: ClientRequestData(
              method: ClientMethod.PATCH,
              path: path,
              headers: headers,
              query: query,
              timeout: timeout,
              body: body));

  Future<ClientResponse> delete(final String path,
          {final Map<String, String>? headers,
          final Map<String, String>? query,
          final int? timeout}) async =>
      willHttpWorkflow.start(
          requestData: ClientRequestData(
              method: ClientMethod.DELETE,
              path: path,
              headers: headers,
              query: query,
              timeout: timeout));
}
