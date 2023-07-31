class Booking {
  Booking({
    this.selectedDay,
    this.selectedHour,
  });
  final DateTime? selectedDay;
  final int? selectedHour;

  Booking copyWith({
    DateTime? selectedDay,
    int? selectedHour,
  }) {
    return Booking(
      selectedDay: selectedDay ?? this.selectedDay,
      selectedHour: selectedHour ?? this.selectedHour,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedDay': selectedDay?.millisecondsSinceEpoch,
      'selectedHour': selectedHour,
    };
  }

  @override
  String toString() =>
      'Booking(selectedDay: $selectedDay, selectedHour: $selectedHour)';
}
