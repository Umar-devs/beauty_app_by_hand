import 'package:beauty_app_by_hand/View/Pages/Details%20Screen/details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/constants.dart';
import '../Widgets/Reusable Components/reusable_txt.dart';

class ActiveOrdersView extends StatefulWidget {
  const ActiveOrdersView({super.key});

  @override
  State<ActiveOrdersView> createState() => _ActiveOrdersViewState();
}

class _ActiveOrdersViewState extends State<ActiveOrdersView> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('Orders List');
  final User? user = FirebaseAuth.instance.currentUser;
  final bool loadOnce = false;
  @override
  Widget build(BuildContext context) {
    final userId = user?.uid;
    final width = screenWidth(context);
    final height = screenHeight(context);
    return StreamBuilder(
      stream: databaseRef.orderByChild('status').equalTo('active').onValue,
      builder: (
        context,
        snap,
      ) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else {
          print(userId);
          if (snap.hasData &&
              !snap.hasError &&
              snap.data?.snapshot.value != null) {
            Map<dynamic, dynamic>? data =
                snap.data?.snapshot.value as Map<dynamic, dynamic>?;
            List<Map<String, dynamic>> filteredItems = [];
            data?.forEach((index, data) {
              if (data is Map &&
                  data.containsKey('userId') &&
                  data['userId'] == userId) {
                filteredItems.add({"key": index, ...data});
              }
            });

            return filteredItems.isEmpty
                ? Center(
                    child: ReusableText(
                        weight: FontWeight.w500,
                        fontSize: width * 0.04,
                        clr: Colors.black,
                        lbl: 'No Data'))
                : ListView.builder(
// reverse: true,
                    scrollDirection: Axis.vertical,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: ListTile(
                            tileColor: themeColor,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            title: Row(
                              children: [
                                ReusableText(
                                  fontSize: width * 0.035,
                                  weight: FontWeight.w700,
                                  clr: Colors.black,
                                  lbl: filteredItems[index]['category'],
                                  alignTxt: TextAlign.start,
                                ),
                                ReusableText(
                                  fontSize: 10,
                                  alignTxt: TextAlign.start,
                                  weight: FontWeight.w400,
                                  clr: Colors.black,
                                  lbl: '(£${filteredItems[index]['price']})',
                                ),
                              ],
                            ),
// Text('Order Key ${item[index]['key']}'), for key
                            subtitle: ReusableText(
                              fontSize: width * 0.03,
                              weight: FontWeight.w500,
                              clr: Colors.black,
                              alignTxt: TextAlign.start,
                              lbl: filteredItems[index]['service'],
                            ),
                            trailing: Container(
                              height: height * 0.035,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: ReusableText(
                                  fontSize: width * 0.03,
                                  weight: FontWeight.w500,
                                  clr: Colors.black,
                                  lbl: 'Details',
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(
                                  const DetailsScreen(
                                      title: 'title',
                                      categoryDetails: 'categoryDetails',
                                      numOfSubCategories:4),
                                  duration: const Duration(milliseconds: 700),
                                  transition: Transition.fadeIn);
                            },
                          ),
                        ),
                      );
                    },
                  );
          } else {
            return Center(
                child: ReusableText(
              fontSize: width * 0.04,
              weight: FontWeight.w700,
              clr: Colors.black,
              lbl: 'No data',
            ));
          }
        }
      },
    );
  }
}
// status: filteredItems[index]['status'],
// package: filteredItems[index]['package'],
// pickDate: filteredItems[index]['pickDate'],
// pickTime: filteredItems[index]['pickTime'],
// dropDate: filteredItems[index]['dropDate'],
// dropTime: filteredItems[index]['dropTime'],
// fragrance: filteredItems[index]
// ['fragrance'],
// detergent: filteredItems[index]
// ['detergent'],
// ind: filteredItems[index]['key'],
// payInt: filteredItems[index]['datetimeEtc'],
// notes: filteredItems[index]['notes'],
// subtotal: filteredItems[index]['price'],
// address: filteredItems[index]['address'],
// userID: filteredItems[index]['userId'],
// orderTime: filteredItems[index]
// ['time of order place'],
// firstStatusTitle: 'Active',
// secStatusTitle: 'Cancel',
// firstBtnTitle: 'Active Order',
// secBtnTitle: 'Cancel Order',