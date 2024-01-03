import 'package:beauty_app_by_hand/Controller/Treatment%20Controller/treatment_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

void fetchCategory() {
  final User? user = FirebaseAuth.instance.currentUser;
  final GetCategoryController getCategoryController =
      Get.put(GetCategoryController());
  if (user != null) {
    final String userId = user.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Category').child(userId);
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      final Map<dynamic, dynamic> userData =
          snapshot.value as Map<dynamic, dynamic>;
      final category = userData['category'];
      getCategoryController.getCategory(category);
    });
  }
}

void fetchSubCategory() {
  final User? user = FirebaseAuth.instance.currentUser;
  final GetSubCategoryController getSubCategoryController =
      Get.put(GetSubCategoryController());
  if (user != null) {
    final String userId = user.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('SubCategory').child(userId);
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      final Map<dynamic, dynamic> userData =
          snapshot.value as Map<dynamic, dynamic>;
      final subCategory = userData['sub category'];
      getSubCategoryController.getSubCategory(subCategory);
    });
  }
}
void fetchPrice() {
  final User? user = FirebaseAuth.instance.currentUser;
  final GetPriceController getPriceController =Get.put(GetPriceController());
  if (user != null) {
    final String userId = user.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Price').child(userId);
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      final Map<dynamic, dynamic> userData =
          snapshot.value as Map<dynamic, dynamic>;
      final price = userData['price'];
      getPriceController.getPrice(price);
    });
  }
}
