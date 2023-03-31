import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontrolpanel/components/empty_page.dart';
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
      //   body: Stack(
      //   children: [
      //     IconButton(
      //       icon: Icon(Icons.menu),
      //       onPressed: _toggleSidebar,
      //     ),
      //     _screens[_currentIndex],
      //     SlideTransition(
      //       position: _animation,
      //       child: Drawer(
      //         child: ListView(
      //           children: [
      //             ListTile(
      //               leading: Icon(Icons.dashboard),
      //               title: Text('Dashboard'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 0;
      //                 });
      //                 _toggleSidebar();
      //               },
      //             ),
      //             ListTile(
      //               leading: Icon(Icons.video_camera_back),
      //               title: Text('List Camera'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 1;
      //                 });
      //                 _toggleSidebar();
      //               },
      //             ),
      //             ListTile(
      //               leading: Icon(Icons.warning),
      //               title: Text('Video Violation'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 2;
      //                 });
      //                 _toggleSidebar();
      //               },
      //             ),
      //             ListTile(
      //               leading: Icon(Icons.bar_chart),
      //               title: Text('Statistics'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 3;
      //                 });
      //                 _toggleSidebar();
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SideBar(
        initialIndex: currentIndex,
        children: [
          Center(
            child: Text("Dashboard"),
          ),
          Center(
            child: ListCameraScreen(index: currentIndex_listcamera,),
          ),
          Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search video",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)))),
                ),
                //EmptyPage(),
                Container(
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Video1",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        Icon(
                          Icons.download,
                          color: Colors.black87,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: EmptyPage(),
                )
                /*Container(
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Video1",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        Icon(
                          Icons.download,
                          color: Colors.black87,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Video1",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        Icon(
                          Icons.download,
                          color: Colors.black87,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Video1",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        Icon(
                          Icons.download,
                          color: Colors.black87,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),*/



              ],
            ),

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
