import 'package:get/get.dart';
import 'package:youtube_clone_app/src/models/statistics.dart';
import 'package:youtube_clone_app/src/models/youtube_video_result.dart';
import 'package:youtube_clone_app/src/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos() async {
    /* TODO : 채널 아이디 */
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCcQTRi69dsVYHN3exePtZ1A&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBMemiZMtzw3OAASdxSK6yoV-1UISvGncg";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=statistics&key=AIzaSyBMemiZMtzw3OAASdxSK6yoV-1UISvGncg&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyBMemiZMtzw3OAASdxSK6yoV-1UISvGncg&id=$channelId"; // TODO: API KEY 외부캡슐화작업해야함.
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
