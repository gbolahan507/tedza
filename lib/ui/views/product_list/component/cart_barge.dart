import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge(
      {super.key, this.icon, required this.cartLength, this.onPressed});

  final String cartLength;
  final Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        badgeAnimation: const badges.BadgeAnimation.slide(
          disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
          curve: Curves.easeInCubic,
        ),
        badgeStyle: const badges.BadgeStyle(badgeColor: Colors.black),
        badgeContent: Text(
          cartLength,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        child: IconButton(
            icon: Icon(
              icon ?? Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: onPressed));
  }
}
