import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.055),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Find The Best Coffee for You',
              style: TextStyle(
                fontSize: screenHeight * 0.037,
                fontWeight: FontWeight.bold,
                color:  AppColors.whiteClr,
              ),
            ),
            SizedBox(height: screenHeight * 0.042),
            Text(
              'Lorem ipsum dolor sit amet, adipiscing elit. '
              'Nullam pulvinar dolor sed enim eleifend efficitur.',
              style: TextStyle(
                fontSize: screenHeight * 0.021,
                color:  AppColors.whiteClr.withOpacity(0.8),
                height: screenHeight * 0.002,
              ),
            ),
            SizedBox(height: screenHeight * 0.068),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: screenHeight * 0.115,
                width: screenWidth * 0.221,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:  AppColors.whiteClr,
                    width: screenHeight * 0.003,
                  ),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 50.0,
                  color:  AppColors.whiteClr,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.068),
          ],
        ),
      ),
    );
  }
}
