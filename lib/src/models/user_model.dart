import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String uid;
  String phone;
  String city;
  String jobCategory;
  String personWorkStatus;

  UserModel({
    required this.name,
    required this.uid,
    required this.phone,
    required this.city,
    required this.jobCategory,
    required this.personWorkStatus,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        name: json['name'] as String,
        uid: json['uid'],
        phone: json['phone'] as String,
        city: json['city'] as String,
        jobCategory: json['jobCategory'] as String,
        personWorkStatus: json['personWorkStatus'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'phone': phone,
        'city': city,
        'jobCategory': jobCategory,
        'personWorkStatus': personWorkStatus,
      };

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final userModel = UserModel.fromJson(snapshot as Map<String, dynamic>);
    return userModel;
  }
}
