import 'package:class_assignment_2/src/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageDao {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('messages');

  void saveMessage(Message message) {
    _collection.add(message.toJson());
  }

  Stream<QuerySnapshot> getMessagesStream() {
    return _collection.orderBy('date', descending: true).snapshots();
  }
}
