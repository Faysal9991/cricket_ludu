import 'package:beting_app/Helper/style.dart';
import 'package:beting_app/sceens/nevigation%20screens/video_url.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Style.backgroundColor3,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const Text("আসসালামু আলাইকুম । কিং জোন বিডির পক্ষ থেকে আপনাকে আন্তরিক শুভেচ্ছা ও ধন্যবাদ 💗। আমাদের অ্যাপের কিছু রুলস আছে দয়া করে একটু পড়ে নিবেন  👇👇\n১। কিভাবে ডিপোজিট করবেন ?"),
             Padding(
               padding:  EdgeInsets.only(left: width*0.24),
               child: Videourl(height: height, width: width,
               gotoyoutube: (){},
               ),
             )
             ],
          ),
        ),
      ),
    );
  }
}
