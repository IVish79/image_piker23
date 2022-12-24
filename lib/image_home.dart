import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_piker23/video_home.dart';

class image_home extends StatefulWidget {
  const image_home({Key? key}) : super(key: key);

  @override
  State<image_home> createState() => _image_homeState();
}

class _image_homeState extends State<image_home> {
  ImagePicker _picker = ImagePicker();
  XFile? image;
  List<XFile> images = [];

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
                image = await _picker.pickImage(source: ImageSource.camera);
                setState(() {});
              },
              child: Text("Camera")),
          ElevatedButton(
              onPressed: () async {
                image = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: Text("gellary")),
          ElevatedButton(
              onPressed: () async {
                images = await _picker.pickMultiImage();
                print(images);
                setState(() {});
              },
              child: Text("Multi Images")),
          image != null ? Image.file(File(image!.path)) : Text("No Image"),
          Expanded(child: images.length != 0
              ? ListView.builder(
            itemCount: images.length,shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                    height: 100,
                    width: 100,
                    child: Image.file(File(images[index].path))),
              );
            },): Text("No Image"),),
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return video_home();
            },));
          }, child: Text("GO TO VIDEO SELECTION"))
        ],
      ),
    );
  }
}
