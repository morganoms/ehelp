enum BookedStatus { confirmed, pending }

extension StringToBookedStatus on String {
  BookedStatus convertToBookedStatus() {
    switch (toUpperCase()) {
      case 'CONFIRMED':
        return BookedStatus.confirmed;
      default:
        return BookedStatus.pending;
    }
  }
}

extension BookedStatusToLabel on BookedStatus {
  String get label {
    switch (this) {
      case BookedStatus.confirmed:
        return 'CONFIRMED';
      default:
        return 'PENDING';
    }
  }
}
