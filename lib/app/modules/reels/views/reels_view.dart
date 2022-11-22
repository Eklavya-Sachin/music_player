import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/reels_controller.dart';
import 'package:better_player/better_player.dart';

class ReelsView extends GetView<ReelsController> {
  const ReelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: controller.pageController,
          scrollDirection: Axis.vertical,
          itemCount: controller.reelVideoLinksList.length,
          onPageChanged: controller.onReelSwipe,
          itemBuilder: (context, index) {
            return Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Obx(
                  () => BetterPlayer.network(
                    controller
                        .reelVideoLinksList[controller.currentReelIndex.value],
                    betterPlayerConfiguration: BetterPlayerConfiguration(
                      allowedScreenSleep: false,
                      autoPlay: true,
                      looping: true,
                      fit: BoxFit.cover,
                      aspectRatio: .2,
                      expandToFill: true,
                      errorBuilder: (context, errorMessage) {
                        return Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.error,
                                size: 60,
                              ),
                              const SizedBox(height: 10),
                              Text(errorMessage.toString()),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: controller.goToMusicLibrary,
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    child: const Icon(
                      Icons.library_books_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
