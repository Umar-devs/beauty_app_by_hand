import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

void saveAddress(
  String lane1,
  String lane2,
  String city,
  String county,
) {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userId = user.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Address').child(userId);
    databaseRef.set({
      'lane 1': lane1,
      'lane 2': lane2,
      'city': city,
      'county': county,
    });
  }
}

void savePhone(String phone) {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userId = user.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Phone Number').child(userId);
    try {
      databaseRef.set({'phone': phone}).then((value) {
        Utils().toastMessage('Number Saved Successfully.');
        Get.back();
      });
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}
