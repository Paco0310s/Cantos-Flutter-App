class UserModel {
  String uuid;
  String name;
  String email;
  String photoUrl;
  String? phone;
  DateTime? birth;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    required this.uuid,
    required this.name,
    required this.email,
    required this.photoUrl,
    this.phone,
    this.birth,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuid: json["uuid"],
        name: json["name"],
        email: json["email"],
        photoUrl: json["photoUrl"],
        phone: json["phone"],
        birth: json["birth"] != null ? DateTime.parse(json["birth"]) : null,
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "phone": phone,
        "birth": birth?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

      
}