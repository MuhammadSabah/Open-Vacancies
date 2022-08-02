import 'dart:async';

import 'package:class_assignment_2/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileDao {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  // Get name field from firestore
  Future<String?> getUserName() async {
    String userName = '';
    DocumentReference userDocId = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    userDocId.get().then((DocumentSnapshot snapshot) => {
          userName = (snapshot.data() as Map<String, dynamic>)['name'],
        });
    return userName;
  }

  // Save the user inside users collection as a document object;
  void saveUser(UserModel user) async {
    final userDocId =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    userDocId.get().then((snapshot) => {
          if (!snapshot.exists)
            {
              _users.doc(user.uid).set(user.toJson()),
            }
        });
  }
}
