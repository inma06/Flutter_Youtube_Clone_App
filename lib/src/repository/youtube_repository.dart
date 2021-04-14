import 'package:get/get.dart';
import 'package:youtube_clone_app/src/models/youtube_video_result.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos() async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCEdsGM2ALcUGkUCNSMAthLg&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBMemiZMtzw3OAASdxSK6yoV-1UISvGncg";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
}
