import 'package:basearch/src/features/onboarding/presentation/viewmodel/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView.builder(
        controller: _controller.pageController,
        onPageChanged: _controller.selectedPageIndex,
        itemCount: _controller.onboardingPages.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(_controller.onboardingPages[index].imageAsset),
                const SizedBox(height: 25),
                Text(
                  _controller.onboardingPages[index].title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: Text(
                      _controller.onboardingPages[index].discription,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ))
              ],
            ),
          );
        },
      ),
      Positioned(
          right: 20,
          bottom: 20,
          child: ElevatedButton(onPressed: () {
            Modular.to.navigate("/get-started");
          }, child: Obx(() {
            return Text(_controller.isLastPage
                ? 'buttonOnboardingLastPage'.i18n()
                : 'buttonOnboarding'.i18n());
          }))),
    ]));
  }
}
