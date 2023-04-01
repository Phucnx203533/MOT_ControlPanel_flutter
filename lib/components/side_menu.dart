import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontrolpanel/screens/list_video_violation.dart';
import 'package:fluttercontrolpanel/screens/list_camera.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:side_bar_custom/side_bar_custom.dart';
class SideMenu extends StatelessWidget {
  final int currentIndex;
  final int currentIndex_listcamera;
  const SideMenu({super.key,required this.currentIndex,required this.currentIndex_listcamera});

  @override
  Widget build(BuildContext context) {
    double  heightR,widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    return Scaffold(
      body: SideBar(
        initialIndex: currentIndex,
        children: [
          Center(
            child: Text("Dashboard"),
          ),
          Center(
            child: ListCameraScreen(index: currentIndex_listcamera,),
          ),
          Center(
            child: ListVideoViolation(),
          ),
          Center(
            child: Text("statistic"),
          ),
        ],
        items: [
          SideBarItem(
            text: "Dashboard",
            icon: Icons.dashboard,
            tooltipText: "Dashboard page",
          ),
          SideBarItem(
            text: "List Camera",
            icon: Icons.video_collection_rounded,
            tooltipText: "List camera page",
          ),
          SideBarItem(
            text: "Video violation",
            icon: Icons.slow_motion_video,
            tooltipText: "Video violation page",
          ),
          SideBarItem(
            text: "Statistic",
            icon: Icons.bar_chart,
            tooltipText: "Statistic page",
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child:
          AnimatedTextKit(animatedTexts: [TyperAnimatedText('Dashboard')]))
    ]);
  }
}

// class ListCameraScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       Center(
//           child:
//               AnimatedTextKit(animatedTexts: [TyperAnimatedText('Listcamera')]))
//     ]);
//   }
// }

class VideoViolationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: AnimatedTextKit(
              animatedTexts: [TyperAnimatedText('Video violation')]))
    ]);
  }
}

class StatisticScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child:
          AnimatedTextKit(animatedTexts: [TyperAnimatedText('Statistic')]))
    ]);
  }
}
