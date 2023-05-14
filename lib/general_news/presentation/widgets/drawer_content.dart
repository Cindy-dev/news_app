import 'package:flutter/material.dart';
import '../../../constants/theme.dart';

class DrawerContent extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;
  const DrawerContent({Key? key, required this.image, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: appTheme.primaryColor),
                  child: Image.asset(
                    image,
                    scale: 2,
                  )),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.headingMedium2TextBlack,
                ),
              ),
            ],
          ),
        ));
  }
}
