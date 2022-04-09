import 'package:basearch/src/features/onboarding/presentation/viewmodel/onboarding_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/utils.dart';
import 'package:localization/localization.dart';
import 'package:get/state_manager.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  bool get isFirstPage => selectedPageIndex.value == 1;
  var pageController = PageController();

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('lib/assets/images/logo.svg', 'titlePage1Onboarding'.i18n(),
        'discriptionPage1Onboarding'.i18n()),
    OnboardingInfo('lib/assets/images/get-started.svg',
        'titlePage2Onboarding'.i18n(), 'discriptionPage2Onboarding'.i18n()),
    OnboardingInfo('lib/assets/images/password_reset.svg',
        'titlePage3Onboarding'.i18n(), 'discriptionPage3Onboarding'.i18n()),
  ];
}
