import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/controller/youtube_datail_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetail extends GetView<YoutubeDetailController> {
  const YoutubeDetail({Key key}) : super(key: key);

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            // 영상제목
            controller.title,
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text(controller.viewCount,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  )),
              Text(" · "),
              Text(controller.publishTime,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        controller.description,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buttonOne(String iconPath, String text) {
    return Column(
      children: [
        SvgPicture.asset("assets/svg/icons/$iconPath"),
        Text(text),
      ],
    );
  }

  Widget _buttonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne("like.svg", controller.likeCount),
        _buttonOne("dislike.svg", controller.dislikeCount),
        _buttonOne("share.svg", "공유"),
        _buttonOne("save.svg", "저장"),
      ],
    );
  }

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network(controller.youtuberThumbnailUrl).image,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                controller.channelTitle,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "구독자 ${controller.subscriberCount}",
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
        ),
        GestureDetector(
          child: Text(
            "구독",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        )
      ]),
    );
  }

  Widget get line => Container(
        height: 1,
        color: Colors.black.withOpacity(0.1),
      );

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          line,
          _descriptionZone(),
          _buttonZone(),
          SizedBox(
            height: 30,
          ),
          line,
          _ownerZone(),
        ],
      ),
    );
  }

  /* 유튜브 영상 부분 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller.youtubePlayerController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  controller.youtubePlayerController.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            ],
            onReady: () {},
            onEnded: (data) {},
          ),
          Expanded(
            child: _description(),
          )
        ],
      ),
    );
  }
}
