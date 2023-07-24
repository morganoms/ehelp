enum UserType { adm, contratante, prestador }

extension IntToUserType on int {
  UserType convertToUserType() {
    switch (this) {
      case 1:
        return UserType.adm;
      case 2:
        return UserType.prestador;
      default:
        return UserType.contratante;
    }
  }
}

extension UserTypeToInt on UserType {
  int convertToint() {
    switch (this) {
      case UserType.adm:
        return 1;
      case UserType.prestador:
        return 2;
      default:
        return 3;
    }
  }
}
