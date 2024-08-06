import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices(this.uid);

  final userCollection = FirebaseFirestore.instance.collection("users");

  saveData(String email) async {
    await userCollection
        .doc(uid)
        .set({"email": email, "buddy": "", "goal": "", "timing": null});
  }
}
