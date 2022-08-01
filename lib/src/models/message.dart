import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String company;
  final String role;
  final String url;
  final DateTime date;
  Message({
    required this.company,
    required this.role,
    required this.url,
    required this.date,
  });

  factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
        company: json['company'] as String,
        role: json['role'] as String,
        date: DateTime.parse(json['date'] as String),
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date.toString(),
        'company': company,
        'role': role,
        'url': url,
      };

  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    final message = Message.fromJson(snapshot.data() as Map<String, dynamic>);
    return message;
  }
}
