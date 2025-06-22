import 'package:flutter/material.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class XBottomNavigationBar extends StatelessWidget {
  const XBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: XColors.primary.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIconButton(
                Iconsax.home_copy,
                () => Navigator.of(context)
                    .pushNamed(XServicesStrings.homeScreen)),
            buildIconButton(
                Iconsax.huobi_token_ht_copy,
                () => Navigator.of(context)
                    .pushNamed(XServicesStrings.homeScreen)),
            buildIconButton(
                Iconsax.heart_copy,
                () => Navigator.of(context)
                    .pushNamed(XServicesStrings.homeScreen)),
            buildIconButton(
                Iconsax.receipt_2_1_copy,
                () => Navigator.of(context)
                    .pushNamed(XServicesStrings.homeScreen)),
            buildIconButton(
                Iconsax.setting_2_copy,
                () => Navigator.of(context)
                    .pushNamed(XServicesStrings.homeScreen)),
          ],
        ),
      ),
    );
  }
}

Widget buildIconButton(IconData icon, Function() onPressed) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(
      icon,
      size: 30,
    ),
  );
}
