class UserModel {
  final String uid;
  final String name;
  final String phone;
  final String bloodGroup;
  final String email;

  UserModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.bloodGroup,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      name: data['name'],
      phone: data['phone'],
      bloodGroup: data['bloodGroup'],
      email: data['email'],
    );
  }
}
