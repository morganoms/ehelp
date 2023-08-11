import 'package:http/http.dart';

enum ServiceStatus {
  activeUser,
  blokedUser,
  canceledService,
  bookedService,
  finishedService,
}

extension IntToServiceStatusType on int {
  ServiceStatus? convertToServiceStatus() {
    switch (this) {
      case 1:
        return ServiceStatus.activeUser;
      case 2:
        return ServiceStatus.blokedUser;
      case 3:
        return ServiceStatus.canceledService;
      case 4:
        return ServiceStatus.bookedService;
      case 5:
        return ServiceStatus.finishedService;
      default:
        throw ClientException('Status de serviço não encontrado');
    }
  }
}

extension ServiceStatusToString on ServiceStatus {
  String convertToString() {
    switch (this) {
      case ServiceStatus.activeUser:
        return 'Usuário Ativo';
      case ServiceStatus.blokedUser:
        return 'Usuário Bloqueado';
      case ServiceStatus.canceledService:
        return 'Serviço Cancelado';
      case ServiceStatus.bookedService:
        return 'Serviço Agendado';
      case ServiceStatus.finishedService:
        return 'Serviço Concluído';
      default:
        throw ClientException('Status de serviço não encontrado');
    }
  }
}
