
class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  String? otp;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.otp
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      status: json['status'],
      otp: json['otp']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id' : id,
      'name' : name, 
      'email' : email,
      'password' : password,
      'phone' : phone,
      'created_at' : createdAt,
      'updated_at' : updatedAt,
      'status' : status,
      'otp' : otp
    };
  }
}