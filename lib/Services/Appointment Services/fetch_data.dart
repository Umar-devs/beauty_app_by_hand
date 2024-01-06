import 'package:beauty_app_by_hand/Controller/Appointment%20Controllers/fetch_date_controller.dart';
import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

void fetchDate() {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    final FetchDateController fetchDateController =
        Get.put(FetchDateController());
    if (user != null) {
      final String userId = user.uid;
      final databaseRef = FirebaseDatabase.instance
          .ref()
          .child('Appointment Date')
          .child(userId);
      databaseRef.onValue.listen((event) {
        DataSnapshot snapshot = event.snapshot;
        final Map<dynamic, dynamic> userData =
            snapshot.value as Map<dynamic, dynamic>;
        final String date = userData['date'];
        fetchDateController.fetchDate(date);
      });
    }
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
}

void fetchTime() {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    final FetchTimeController fetchDayController =
        Get.put(FetchTimeController());
    if (user != null) {
      final String userId = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('Time Slot').child(userId);
      databaseRef.onValue.listen((event) {
        DataSnapshot snapshot = event.snapshot;
        final Map<dynamic, dynamic> userData =
            snapshot.value as Map<dynamic, dynamic>;
        final String timeSlot = userData['timeSlot'];
        fetchDayController.fetchDay(timeSlot);
      });
    }
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
}
