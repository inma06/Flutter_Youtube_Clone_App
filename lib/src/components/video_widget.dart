import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key key}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5), // TODO: NetWork로 대체
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(
                    "https://yt3.ggpht.com/ytc/AAUvwngEehZhnDTCZpvgqOgN2h0j-JXAI8d7SbODofu9gA=s88-c-k-c0x00ffffff-no-rj")
                .image,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "아타 유튜브 다시 보기아타 유튜브 다시 보기아타 유튜브 다시 보기",
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      icon: const Icon(Icons.more_vert, size: 18),
                      onPressed: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "채널명",
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(" · "),
                    Text(
                      "조회수 10000",
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),
                    Text(" · "),
                    Text(
                      "2021-04-14",
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
