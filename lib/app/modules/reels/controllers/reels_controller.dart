import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:musically/app/routes/app_pages.dart';

class ReelsController extends GetxController {
  final currentReelIndex = 0.obs;
  final reelVideoLinksList = [
    'https://vod-progressive.akamaized.net/exp=1669156845~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2914%2F22%2F564574433%2F2669654130.mp4~hmac=074dec96b98840bf5e405a0ba80853b1ac845d07be1eff4d6acfc6ed7d928cbe/vimeo-prod-skyfire-std-us/01/2914/22/564574433/2669654130.mp4',
    'https://vod-progressive.akamaized.net/exp=1669156867~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1351%2F20%2F506758805%2F2325591239.mp4~hmac=3cab7ebc8c1408ed0ef03c24346cb7166d339ab354405867433220e3b1bdb11a/vimeo-prod-skyfire-std-us/01/1351/20/506758805/2325591239.mp4',
    'https://vod-progressive.akamaized.net/exp=1669156876~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2273%2F17%2F436368045%2F1902841200.mp4~hmac=874e4feb3cd7c486cbe8bf1b041623d98c767417591013a4f9ec8f4950520e42/vimeo-prod-skyfire-std-us/01/2273/17/436368045/1902841200.mp4',
  ];

  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onReelSwipe(int index) {
    currentReelIndex.value = index;
  }

  void goToMusicLibrary() {
    Get.toNamed(Routes.LIBRARY);
  }
}
