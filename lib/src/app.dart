import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:youtube_clone_app/src/pages/explore.dart';
import 'package:youtube_clone_app/src/pages/home.dart';
import 'package:youtube_clone_app/src/pages/library.dart';
import 'package:youtube_clone_app/src/pages/subscribe.dart';

import 'controller/app_controller.dart';

class App extends GetView<AppController> {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          switch (RouteName.values[controller.currentIndex.value]) {
            case RouteName.Home:
              return Home();
              break;
            case RouteName.Explore:
              return Explore();
              break;
            case RouteName.Subscribe:
              return Subscribe();
              break;
            case RouteName.Library:
              return Library();
              break;
            case RouteName.Add:
              break;
          }
          return Container();
        }),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            selectedItemColor: Colors.black,
            onTap: controller.changePageIndex,
            items: [
              /* 홈 */
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/home_off.svg",
                  width: 22,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/home_on.svg",
                  width: 22,
                ),
                label: "홈",
              ),

              /* 탐색 */
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/compass_off.svg",
                  width: 22,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/compass_on.svg",
                  width: 22,
                ),
                label: "탐색",
              ),

              /* 플러스 */
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(
                    "assets/svg/icons/plus.svg",
                    width: 35,
                  ),
                ),
                label: "",
              ),

              /* 구독 */
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/subs_off.svg",
                  width: 22,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/subs_on.svg",
                  width: 22,
                ),
                label: "구독",
              ),

              /* 보관함 */
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/library_off.svg",
                  width: 22,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/library_on.svg",
                  width: 22,
                ),
                label: "보관함",
              ),
            ],
          ),
        ));
  }
}
