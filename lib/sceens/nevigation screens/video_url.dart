
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Videourl extends StatelessWidget {
  const Videourl({
    Key? key,
    required this.height,
    required this.width,
    this.gotoyoutube
  }) : super(key: key);

  final double height;
  final double width;
 final VoidCallback? gotoyoutube;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: gotoyoutube,
      child: Container(
        height: height * 0.07,
        width: width * 0.5,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(7)),
        child: Column(children: const [
          Icon(
            FontAwesomeIcons.youtube,
            color: Colors.red,
          ),
          Text("Watch now")
        ]),
      ),
    );
  }
}
