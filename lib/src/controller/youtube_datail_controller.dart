import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone_app/src/controller/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  VideoController videoController;
  YoutubePlayerController youtubePlayerController;
  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters["videoId"]);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: Get.parameters["videoId"],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    // print(videoController.video.snippet.title);
    super.onInit();
  }

  String get title => videoController.video.snippet.title; // 제목
  String get viewCount =>
      "조회수 ${videoController.statistics.value.viewCount}회"; // 조회수
  String get publishTime => DateFormat("yyyy-MM-dd")
      .format(videoController.video.snippet.publishTime); // 생성일
  String get description => videoController.video.snippet.description; // 설명란
  String get likeCount => videoController.statistics.value.likeCount; // 좋아요
  String get dislikeCount =>
      videoController.statistics.value.dislikeCount; // 싫어요
  String get youtuberThumbnailUrl =>
      videoController.youtuberThumbnailUrl; // 채널 썸네일
  String get channelTitle =>
      videoController.video.snippet.channelTitle; // 채널 이름
  String get subscriberCount =>
      videoController.youtuber.value.statistics.subscriberCount; // 구독자 수
}
