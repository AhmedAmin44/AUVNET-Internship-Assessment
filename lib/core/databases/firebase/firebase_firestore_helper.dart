import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(uid).set(data);
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }
}
