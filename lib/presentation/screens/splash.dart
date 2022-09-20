import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/colors.dart';
import '../resources/asset_manager.dart';
import 'components/bottom_part.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool cupAnimated = false;
  bool animateCafeText = false;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        cupAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.brownClr,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: cupAnimated ? screenHeight / 1.95 : screenHeight,
            decoration: BoxDecoration(
              color: AppColors.whiteClr,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(cupAnimated ? 40.0 : 0.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: !cupAnimated,
                  child: Lottie.asset(
                    JsonAssets.animatedCoffee,
                    controller: _coffeeController,
                    onLoaded: (composition) {
                      _coffeeController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: cupAnimated,
                  child: Image.asset(
                    ImageAssets.coffeCupImage,
                    height: screenHeight * 0.25 ,
                    width: screenWidth * 0.5,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCafeText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child:  Text(
                      'C A F É',
                      style: TextStyle(
                        fontSize: screenHeight * 0.068,
                        color: AppColors.brownClr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(
            visible: cupAnimated,
            child: const BottomPart(),
          ),
        ],
      ),
    );
  }
}
