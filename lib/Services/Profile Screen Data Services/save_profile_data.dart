import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

void saveName(String name) {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      final String userId = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('User Name').child(userId);
      databaseRef.set({
        'name': name,
      }).then((value) => Get.back());
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}
