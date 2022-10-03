import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Helper/style.dart';

class UpoldScreenSort extends StatelessWidget {
  const UpoldScreenSort({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "playerZone",
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          backgroundColor: Style.backgroundColor,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell))
          ]),
          body: Column(
            children: [
              SizedBox(height: height*0.24,),
              SizedBox(
width: width,
                child: ElevatedButton(onPressed: (){}, child: Text("Pick up Screensort"))),

              SizedBox(
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: (){}, child: Text("uplod")))
            ],
          ),
    );
  }
}
