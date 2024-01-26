import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


  Future<void> placeOrder(
      String category,
      String service,
      String date,
      String time,
      String phone,
      String payIntent,
      String userAddress,
      String name,
      String price) async {
    // Push a new order to the 'orders' node, Firebase will generate a unique key
    final User? user = FirebaseAuth.instance.currentUser;

    // Format the DateTime object to display time with AM/PM
    final userId = user!.uid;
    final DatabaseReference database =
        FirebaseDatabase.instance.ref().child('Orders List');
    await database.push().set({
      'category': category,
      'service': service,
      'date': date,
      'time': time,
      'price': price,
      'phone': phone,
      'userId': userId,
      'datetimeEtc': payIntent,
      'status': 'pending',
      'address': userAddress,
      'name':name,
    });
  }
