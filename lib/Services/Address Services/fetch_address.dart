import 'package:beauty_app_by_hand/Controller/Address%20Controller/get_address_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

void fetchAddress() {
  final User? user = FirebaseAuth.instance.currentUser;
  final GetAddressController getAddressController =
      Get.put(GetAddressController());
  if (user != null) {
    final userId = user.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Address').child(userId);
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      final Map userData = snapshot.value as Map<dynamic, dynamic>;
      final String lane1 = userData['lane 1'];
      final String lane2 = userData['lane 2'];
      final String city = userData['city'];
      final String county = userData['county'];
      getAddressController.getAddress(lane1, lane2, city, county);
    });
  }
}
void fetchPhone(){
  final User?user=FirebaseAuth.instance.currentUser;
  final GetPhoneController getPhoneController=Get.put(GetPhoneController());
  if(user!=null){
    final userId=user.uid;
    final databaseRef=FirebaseDatabase.instance.ref().child('Phone Number').child(userId);
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot=event.snapshot;
      final Map userData=snapshot.value as Map<dynamic,dynamic>;
      final String phone=userData['phone'];
      getPhoneController.getPhone(phone);
    });
  }
}