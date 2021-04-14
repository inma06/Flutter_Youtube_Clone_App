import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YoutubeDetail extends StatelessWidget {
  const YoutubeDetail({Key key}) : super(key: key);

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "아타나시오 영상 다시보기",
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text("조회수 1000회",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  )),
              Text(" · "),
              Text("2021-02-13",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        "안녕하세요 개발하는 아타나시오 입니다.!!",
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
        _buttonOne("like.svg", "1000"),
        _buttonOne("dislike.svg", "0"),
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
          backgroundImage: Image.network(
                  "https://yt3.ggpht.com/ytc/AAUvwnhb59h3DMSl8IIcBzBLbVQWXx3nBPxdF6XBtpPG=s176-c-k-c0x00ffffff-no-rj")
              .image,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "채널명채널명",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "구독자 100000",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: _description(),
          )
        ],
      ),
    );
  }
}
