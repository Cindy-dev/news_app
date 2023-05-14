import 'package:flutter/material.dart';
import '../../../constants/theme.dart';

class DrawerContent extends StatelessWidget {
  final IconData icon;
  final String title;
  const DrawerContent({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.headingMediumTextBlack,
              ),
            ),
          ],
        ));
  }
}
