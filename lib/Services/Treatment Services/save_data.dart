import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void saveCategory(String category) {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      final userId = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('Category').child(userId);
      databaseRef.set({'category': category});
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}

void saveSubcategory(String subCategory) {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      final userId = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('SubCategory').child(userId);
      databaseRef.set({'sub category': subCategory});
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}

void savePrice(String price) {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      final userId = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('Price').child(userId);
      databaseRef.set({'price': price});
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}
