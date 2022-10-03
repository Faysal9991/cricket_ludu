import 'dart:io';

import 'package:beting_app/Helper/fbase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenSortUplod extends StatefulWidget {
  ScreenSortUplod({super.key});

  @override
  State<ScreenSortUplod> createState() => _ScreenSortUplodState();
}

class _ScreenSortUplodState extends State<ScreenSortUplod> {
  File? imagefile;

  String? fileName;

  FireBase fireBase = FireBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uplod screen Sort"),
      ),
      body: Center(child: ElevatedButton(onPressed: ()async{

        final result = await FilePicker.platform.pickFiles(
            allowMultiple: false,
            type: FileType.custom,
            allowedExtensions: ["png", "jpg"]
        );
        String? path = result?.files.single.path;
        String? name = result?.files.single.name;
        this.setState(() {
          imagefile = File(path!);
          fileName = name;
          print(imagefile!.path);
        });

        final y = await fireBase.uploadImage(imagefile!, fileName!);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ScreenShot uploaded, wait for result")));


      }, child: Text("press here to uplod photo"))),
    );
  }
}