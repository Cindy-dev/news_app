import 'package:flutter/material.dart';
import '../../../constants/theme.dart';

class TopHeadlineCard extends StatelessWidget {
  const TopHeadlineCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text("Top Headlines",
              style: AppTextStyles.headingMediumTextBlack),
        ),
        Stack(
          fit: StackFit.loose,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: appTheme.primaryColorDark,
                  //image: DecorationImage(image: ""),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Positioned(
                top: 10,
                left: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: appTheme.canvasColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Science",
                    style: AppTextStyles.body2Medium,
                  ),
                )),
            Positioned(
                bottom: 25,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "The crypto fear and greed index is in the ‘extreme greed’ territory and the market reflects that sentiment.",
                    style: AppTextStyles.body2MediumWhite,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
