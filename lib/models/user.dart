class UserModel {
  late String? id;
  late String? serverAuthCode;
  late String? email;
  late String? displayName;
  late String? photoUrl;

  UserModel({
    required this.id,
    required this.serverAuthCode,
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serverAuthCode': serverAuthCode,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }

  fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.serverAuthCode = json['serverAuthCode'];
    this.email = json['email'];
    this.displayName = json['displayName'];
    this.photoUrl = json['photoUrl'];
  }
}
