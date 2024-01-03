import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/constants.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {super.key,
      required this.screenWidth,
      required this.prefixIcon,
      required this.postfixIcon,
      required this.title,
      this.wantPostfixIcon = true,
      required this.onTap});
  final double screenWidth;
  final IconData prefixIcon;
  final IconData postfixIcon;
  final bool wantPostfixIcon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: themeLightColor,
            child: Icon(
              // Icons.person_outline,
              prefixIcon,
              size: screenWidth * 0.053,
              color: Colors.black54,
            ),
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
                weight: FontWeight.w500,
                fontSize: screenWidth * 0.035,
                clr: Colors.black,
                lbl: title),
          ),
          trailing: wantPostfixIcon == true
              ? IconButton(
                  onPressed: onTap,
                  icon: FaIcon(
                    postfixIcon,
                    // FontAwesomeIcons.pencilAlt,
                    size: screenWidth * 0.04,
                  ))
              : null,
        ),
      ),
    );
  }
}
