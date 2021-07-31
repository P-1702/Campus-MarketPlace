import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/theme.dart';

import '../size_config.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        color: kPrimaryLightColor,
        child: Row(
          children: [
            Text(
              "Login With Your Bits Email",
              style: TextStyle(color: Colors.black),
            ),
            SvgPicture.asset(icon),
          ],
        ),
      ),
    );
  }
}
