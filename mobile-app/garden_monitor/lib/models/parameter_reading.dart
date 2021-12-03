class ParameterReading {
  double value;
  DateTime timeStamp;

  ParameterReading({
    required this.value,
    required this.timeStamp,
  });

  factory ParameterReading.fromJson(dynamic json) {
    return ParameterReading(
      value: json['value'] as double,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
    );
  }
}
