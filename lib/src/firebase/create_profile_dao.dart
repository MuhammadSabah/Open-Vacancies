import 'package:class_assignment_2/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfileDao {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

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
