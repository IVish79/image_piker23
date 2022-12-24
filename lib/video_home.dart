import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class video_home extends StatefulWidget {
  const video_home({Key? key}) : super(key: key);

  @override
  State<video_home> createState() => _video_homeState();
}

class _video_homeState extends State<video_home> {

    ImagePicker _picker = ImagePicker();
    XFile? video;
    List<XFile> videos = [];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  video = await _picker.pickVideo(source: ImageSource.camera);
                  setState(() {});
                },
                child: Text("Camera Video")),
            ElevatedButton(
                onPressed: () async {
                  video = await _picker.pickVideo(source: ImageSource.gallery);
                  setState(() {});
                },
                child: Text("Gallary Video")),
            video != null ? Image.file(File(video!.path)) : Text("No Video"),
            Expanded(child: videos.length != 0
                ? ListView.builder(
              itemCount: videos.length,shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                      height: 100,
                      width: 100,
                      child: Image.file(File(videos[index].path))),
                );
              },): Text("No Videos"),),

          ],
        ),
      );
    }
  }