import 'package:flutter/material.dart';
import 'package:fluttercontrolpanel/changeNotifier.dart';
import 'package:fluttercontrolpanel/components/side_menu.dart';
import 'package:provider/provider.dart';
class ListCamera extends StatelessWidget {
  const ListCamera({super.key});

  @override
  Widget build(BuildContext context) {
    final width_screen = MediaQuery.of(context).size.width;
    final height_screen = MediaQuery.of(context).size.height;

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return Column(

      children:[
        SizedBox(
          height: height_screen/400,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SideMenu(currentIndex: 1,currentIndex_listcamera: 1,),
                    opaque: false,
                    transitionDuration: Duration(seconds: 0),
                  ),
                );

              },
              child: Text('Add Camera'),
            ),
            SizedBox(
              width: width_screen/200,
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SideMenu(currentIndex: 1,currentIndex_listcamera: 1,),
                    opaque: false,
                    transitionDuration: Duration(seconds: 0),
                  ),
                );

              },
              child: Text('Remove Camera'),
            ),
          ],
        ),
        Consumer<Counter>(
            builder: (context,counter,child){
              return  GridView.count(
                crossAxisCount: 5,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: List.generate(
                  counter.count,
                      (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("phuc"),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
        ),

      ],
    );
  }
}
