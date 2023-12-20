// ignore_for_file: cascade_invocations, library_prefixes

import 'package:ehelp/shared/entity/ws_service_status.entity.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketProfessionalManager {
  late IO.Socket socket;

  void connect() {
    debugPrint('Connecting...');
    socket = IO.io('ws://websocket.ehelpresidencial.com', <String, dynamic>{
      'autoConnect': true,
      'transports': ['websocket'],
    });
    socket.onConnectError((err) => debugPrint(err.toString()));
    socket.onDisconnect((_) => debugPrint('Connection Disconnection'));
    socket.onError((err) => debugPrint(err.toString()));
    socket.onConnect((err) => debugPrint('Conected!'));
  }

  void listenServiceCall(void Function(ServiceStatusWs entidade) listener) {
    socket.on('serviceStatus', (data) {
      debugPrint('serviceStatus Capturado');
      final teste = ServiceStatusWsDto.fromJson(data[0]);
      listener(teste);
      debugPrint(teste.toString());
    });

    // Future.delayed(const Duration(seconds: 2)).then((value) {
    //   socket.emit('getServiceStatus', '2');
    // });
  }
}
