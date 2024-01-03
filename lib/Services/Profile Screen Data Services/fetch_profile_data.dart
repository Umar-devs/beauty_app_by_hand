import 'package:beauty_app_by_hand/Controller/Profile%20controller/email_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/name_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

void fetchName() {
  final User? user = FirebaseAuth.instance.currentUser;
  final NameController nameController = Get.put(NameController());
  if (user != null) {
    final String userId = user.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('User Name').child(userId);
    databaseRef.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      final Map userData = dataSnapshot.value as Map<dynamic, dynamic>;
      final String userName = userData['name'];
      nameController.setName(userName);
    });
  }
}

void fetchEmail() {
  final User? user = FirebaseAuth.instance.currentUser;
  final EmailController emailController = Get.put(EmailController());
  final String? userEmail = user?.email;
  emailController.setEmail(userEmail);
}
