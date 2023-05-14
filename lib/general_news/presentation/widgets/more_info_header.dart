import 'package:flutter/material.dart';
import 'package:news_app/constants/deviceSize.dart';
import 'package:news_app/constants/slide_transition.dart';
import '../../../constants/theme.dart';

class MoreInfoHeader extends StatelessWidget {
  final String? date;
  final String? source;
  const MoreInfoHeader({Key? key, this.date, this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SlideOpacityTransition(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: context.deviceHeight() / 15,
              width: 3,
              color: appTheme.primaryColorDark,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date!, style: AppTextStyles.body2Medium),
                SizedBox(height: 4),
                Text(source!, style: AppTextStyles.headingMedium2TextBlack)
              ],
            )
          ],
        ),
      ),
    );
  }
}
