import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Reusable%20Components/profile_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/constants.dart';

class ProfileInfoTile extends StatelessWidget {
  ProfileInfoTile(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.titleFirstTile,
      required this.prefixIconFirstTile,
      required this.postfixIconFirstTile,
      required this.titleSecTile,
      required this.prefixIconSecTile,
      required this.postfixIconSecTile,
      this.wantFirstPostfixIcon = true,
      this.wantSecPostfixIcon = true,
      required this.topPadding,
      required this.bottomPadding,
      required this.leftPadding,
      required this.rightPadding,
      required this.firstTap,
      required this.secTap});
  final double screenWidth;
  final double screenHeight;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final String titleFirstTile;
  final IconData prefixIconFirstTile;
  final IconData postfixIconFirstTile;
  final String titleSecTile;
  final IconData prefixIconSecTile;
  final IconData postfixIconSecTile;
  final bool wantFirstPostfixIcon;
  final bool wantSecPostfixIcon;
  final User? user = FirebaseAuth.instance.currentUser;
  final VoidCallback firstTap;
  final VoidCallback secTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: topPadding,
          left: leftPadding,
          right: rightPadding,
          bottom: bottomPadding),
      height: screenHeight * 0.16,
      width: screenWidth,
      decoration: BoxDecoration(
          color: themeColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileTile(
            screenWidth: screenWidth,
            prefixIcon: prefixIconFirstTile,
            postfixIcon: postfixIconFirstTile,
            title: titleFirstTile,
            wantPostfixIcon: wantFirstPostfixIcon, onTap: firstTap,
          ),
          Divider(
            color: themeColor.withOpacity(0.6),
          ),
          ProfileTile(
            screenWidth: screenWidth,
            prefixIcon: prefixIconSecTile,
            postfixIcon: postfixIconSecTile,
            wantPostfixIcon: wantSecPostfixIcon,
            title: titleSecTile, onTap:secTap,
          ),
        ],
      ),
    );
  }
}
