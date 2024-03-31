class TimeModel {
  final String time;

  TimeModel({
    required this.time,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
      };
  
}