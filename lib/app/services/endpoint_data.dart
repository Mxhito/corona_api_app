class EndpointData {
  EndpointData({required this.value, this.date});
  final int value;
  final DateTime? date;

  @override
  String toString() {
    return 'date: $date, value: $value';
  }
}
