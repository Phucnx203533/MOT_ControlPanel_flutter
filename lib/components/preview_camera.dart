import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';
class PreviewCamera extends StatelessWidget {
  // final String camUrl;
  // final String username;
  // final String password;
  const PreviewCamera({super.key});

  @override
  Widget build(BuildContext context) {



    // return Container(
    //   // child: Image.network(
    //   //   'http://14.241.46.213:1880/stw-cgi/video.cgi?msubmenu=snapshot&action=view',
    //   //   headers: {'Authorization': 'Basic ' + base64Encode(utf8.encode('admin:Admin@123'))},
    //   // )
    //   child: ,
    //
    // );
    return SvgPicture.network('http://14.241.46.213:1880/stw-cgi/video.cgi?msubmenu=snapshot&action=view');
  }
}
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ImageFromUrl extends StatefulWidget {
//   @override
//   _ImageFromUrlState createState() => _ImageFromUrlState();
// }
//
// class _ImageFromUrlState extends State<ImageFromUrl> {
//   Uint8List _imageBytes = Uint8List(0) ;
//   Future<void> getImageFromUrl() async {
//     // Send an HTTP GET request to the server
//     final response = await http.get(
//       Uri.parse('http://admin:Admin%40123@14.241.46.213:1880/stw-cgi/video.cgi?msubmenu=snapshot&action=view'),
//     );
//
//     if (response.statusCode == 200) {
//       // If the server returns a successful response, decode the image bytes
//       setState(() {
//         _imageBytes = response.bodyBytes;
//       });
//     } else {
//       // If the server returns an error response, print the error message
//       print('Failed to load image: ${response.statusCode}');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getImageFromUrl();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image from URL'),
//       ),
//       body: Center(
//         child: _imageBytes != null
//             ? Image.memory(_imageBytes)
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
