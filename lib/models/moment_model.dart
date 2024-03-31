class MomentModel {
  final String moment;

  MomentModel({
    required this.moment,
  });

  factory MomentModel.fromJson(Map<String, dynamic> json) => MomentModel(
        moment: json["moment"],
      );

  Map<String, dynamic> toJson() => {
        "moment": moment,
      };
  
}