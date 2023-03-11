import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controller/auth.dart';
import '../themes/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoarding> {
  final int numPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  void onIntroEnd() {
    AuthController.to.setOnBoardDataAfterScreenCompleted();
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.secondPrimary : Colors.grey.withOpacity(0.2),
        // gradient: isActive
        //     ? const LinearGradient(
        //         colors: [AppColors.secondPrimary, AppColors.secondPrimary],
        //         begin: Alignment.topRight,
        //         end: Alignment.topLeft)
        //     : null,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => onIntroEnd(),
                  child: Container(
                    height: media.width * 0.08,
                    width: media.width * 0.15,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      // color: Color(0xFF7B51D3)
                    ),
                    alignment: Alignment.centerRight,
                    child: const Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.secondPrimary,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.7,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    children: [
                      buildSlider(
                          title: "Welcome",
                          content: "Savings today, security tomorrow",
                          image: "pay"),
                      buildSlider(
                          title: "Invest in your future, not your wants",
                          content:
                              "Good things come to those who invest wisely.",
                          image: "wallet"),
                      buildSlider(
                          title:
                              "A well organized wallet is the\nkey to financial success",
                          content:
                              "The best time to invest was yesterday\nthe second-best time is today",
                          image: "savings"),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildPageIndicator(),
                ),
                currentPage != numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: InkWell(
                            onTap: () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Container(
                              height: media.width * 0.10,
                              width: media.width * 0.25,
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.primary,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.white.withOpacity(.4),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0.4, 0.6)),
                                ],
                                gradient: const LinearGradient(
                                    colors: [
                                      AppColors.secondary,
                                      AppColors.primary
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                currentPage == numPages - 1
                    ? const SizedBox(
                        height: 25,
                      )
                    : const SizedBox(),
                currentPage == numPages - 1
                    ? GestureDetector(
                        onTap: () {
                          onIntroEnd();
                        },
                        child: Container(
                          height: media.width * 0.13,
                          margin: const EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: AppColors.secondPrimary, width: 2),
                            color: Colors.transparent,
                            // gradient: const LinearGradient(
                            //     colors: [
                            //       AppColors.primary,
                            //       AppColors.secondary
                            //     ],
                            //     begin: Alignment.topRight,
                            //     end: Alignment.topLeft),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.primary.withOpacity(.0),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0.4, 0.6)),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: media.width * 0.04,
                              ),
                              const Text(
                                'Get started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColors.white,
                              ),
                              SizedBox(
                                width: media.width * 0.02,
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildSlider({required title, required content, required image}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: buildSvgPicture(imgSrc: image)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 18, color: AppColors.grey.withOpacity(.7)),
          ),
        )
      ],
    );
  }

  SvgPicture buildSvgPicture({required imgSrc}) {
    return SvgPicture.asset(
      "assets/svgs/$imgSrc.svg",
      height: 350,
    );
  }
}
