import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  /* 로고 */
  Widget _logo() {
    return Container(
      child: Image.asset(
        "assets/images/logo.png",
        width: 130,
      ),
    );
  }

  /* 알람, 서치, 프로필 */
  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 23,
            height: 23,
            child: SvgPicture.asset("assets/svg/icons/bell.svg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset("assets/svg/icons/search.svg"),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: ExactAssetImage(
              "assets/images/default_thumbnail.png"), // TODO : 로그인사용자 프로필 이미지
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(), // 로고
        _actions(), // 알람, 서치, 프로필사진
      ],
    ));
  }
}
