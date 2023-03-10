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
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color:
            isActive ? const Color(0xFF7B51D3) : Colors.grey.withOpacity(0.2),
        gradient: isActive
            ? const LinearGradient(
                colors: [AppColors.primary, AppColors.gradient],
                begin: Alignment.topRight,
                end: Alignment.topLeft)
            : null,
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
                        color: Color(0xFF7B51D3),
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
                        content: "Onboard with us get more earnings",
                        image: "purchase"),
                    buildSlider(
                        title: "The future depends on what you do today",
                        content:
                            "A new job is like a blank\nbook and you are the author",
                        image: "carrer"),
                    buildSlider(
                        title: "Love without conversation is impossible",
                        content:
                            "One good conversation can shift the\ndirection of change forever",
                        image: "chat"),
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
                              gradient: const LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.gradient
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
            ],
          ),
        ),
      ),
      bottomSheet: currentPage == numPages - 1
          ? Container(
              height: media.width * 0.15,
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.primary,
                gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.gradient],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft),
              ),
              child: GestureDetector(
                onTap: () => onIntroEnd(),
                child: const Center(
                  child: Text(
                    'Get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
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
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }

  SvgPicture buildSvgPicture({required imgSrc}) {
    return SvgPicture.asset(
      "assets/svgs/$imgSrc.svg",
      height: 250,
    );
  }
}
