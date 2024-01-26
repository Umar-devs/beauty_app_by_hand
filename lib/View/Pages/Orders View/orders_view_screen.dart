import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Pages/Nav%20Bar/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Widgets/Reusable Components/reusable_txt.dart';
import 'active_order_view.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = screenWidth(context);
    double height = screenHeight(context);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: themeLightColor,
            appBar: AppBar(
              backgroundColor: themeColor,
              centerTitle: true,
              leading: Padding(
                padding: EdgeInsets.only(left: 15, top: height * 0.02),
                child: GestureDetector(
                    onTap: () {
                      Get.to(MyBottomNav(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 700));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.black,
                      size: width * 0.05,
                    )),
              ),
              title: ReusableText(
                weight: FontWeight.w600,
                fontSize: width * 0.04,
                lbl: 'Orders Screen',
                clr: Colors.black,
              ),
              bottom: TabBar(
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    child: ReusableText(
                        weight: FontWeight.w600,
                        fontSize: width * 0.03,
                        clr: Colors.black,
                        lbl: 'Active'),
                  ),
                  Tab(
                    child: ReusableText(
                        weight: FontWeight.w600,
                        fontSize: width * 0.03,
                        clr: Colors.black,
                        lbl: 'Completed'),
                  ),
                  Tab(
                    child: ReusableText(
                        weight: FontWeight.w600,
                        fontSize: width * 0.03,
                        clr: Colors.black,
                        lbl: 'Cancelled'),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                ActiveOrdersView(),
                ActiveOrdersView(),
                ActiveOrdersView(),
              ],
            )));
  }
}
