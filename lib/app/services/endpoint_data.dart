class EndpointData {
  EndpointData({required this.value, required this.date});
  final int value;
  final DateTime? date;

  @override
  String toString() {
    return 'date: $date, value: $value';
  }
}
