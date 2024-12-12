import 'package:admin_ecommerce/screens/login_screen/login_screen.dart';
import 'package:admin_ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:admin_ecommerce/screens/OnBoarding/IntroScreen/intro_page_1.dart';
import 'package:admin_ecommerce/screens/OnBoarding/IntroScreen/intro_page_2.dart';
import 'package:admin_ecommerce/screens/OnBoarding/IntroScreen/intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 8, // Kích thước của mỗi điểm
                    dotWidth: 8, // Kích thước của mỗi điểm
                    spacing: 8, // Khoảng cách giữa các điểm
                    dotColor: Colors.grey, // Màu của điểm
                    activeDotColor: const Color.fromARGB(
                        255, 75, 130, 175), // Màu của điểm đang được chọn
                  ),
                ),

                // next or done

                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
