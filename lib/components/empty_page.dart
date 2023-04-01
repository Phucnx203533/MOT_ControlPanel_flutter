
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttercontrolpanel/firebase_options.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';
class EmptyPage extends StatefulWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('Video').listAll();
    //futureFiles = Firebase.initializeApp.ref('/file').listAll();
  }
  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final Directory directory = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    final path = '${tempDir.path}/${ref.name}';
    // In ra đường dẫn của video để kiểm tra
    print('Video downloaded to $path');


    await Dio().download(
      url,
      path,
      onReceiveProgress: (receied, total) {
        double progress = receied / total;
        setState(() {
          downloadProgress[index] = progress;
        });
      },
    );

    if (url.contains('.mp4')) {
      await GallerySaver.saveVideo(path, toDcim: true);
    } else if (url.contains('ipg')) {
      await GallerySaver.saveImage(path, toDcim: true);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded ${ref.name}')),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;
            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                double? progress = downloadProgress[index];


                return ListTile(
                  title: GetUserName(file.name),
                  subtitle: progress != null
                      ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.black26,
                  )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () {downloadFile(index,file);},
                  ),
                );
              },

            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error occurred'),);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

  }
}
class GetUserName extends StatelessWidget {
  final String documentId;


  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('violation');
    var Id = documentId.split('.');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(Id[0]).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {

          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          
          final String preConverted = data['time'];

          DateTime date = DateTime.parse(snapshot.data!['time'].toDate().toString());
          print("ngay thang ${DateTime.fromMicrosecondsSinceEpoch(snapshot.data!["time"].microsecondsSinceEpoch)}");
          return Text("${snapshot.data!['time'].toDate()}.${data['violation']}.${data['licenseplate']}.${data['local']}");


        }
        return Text("loading");

      },

    );
  }
}
