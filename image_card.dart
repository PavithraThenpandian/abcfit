import 'package:abc_fit/pallete.dart';
import 'package:abc_fit/widgets/linear_progress_bar.dart';
import 'package:abc_fit/widgets/over_image_text.dart';
import 'package:flutter/material.dart';
import 'background_image.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    required this.imagecard,
    required this.headertxt,
    required this.quotetxt,
    required this.buttonfunc,
    required this.valuep,
  });
  final String headertxt;
  final String quotetxt;
  final String imagecard;
  final String buttonfunc;
  final double valuep;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Card(
        // elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Container(
            // padding: EdgeInsets.all(0.5),
            // margin: EdgeInsets.only(top: 20),
            height: size.height * 0.27,
            width: size.width * 2.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: new DecorationImage(
                  image: AssetImage(imagecard),
                  fit: BoxFit.fitWidth,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextOver(
                  header: headertxt,
                  quote: quotetxt,
                  pressfunction: buttonfunc,
                  // stateb: buttonstate,
                ),
                // SizedBox(height: 128.0),
                // Container(
                // padding: EdgeInsets.all(30.0),
                // alignment: Alignment.bottomCenter,
                // height: size.height * 0.015,
                // width: size.width * 0.8,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30.0)),
                Container(
                  // margin: EdgeInsets.symmetric(vertical: 20),
                  // width: 300,
                  // height: 20,
                  child: LinearBar(valuea: valuep),
                )
              ],
            )),
      ),
    );

    // Padding(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: 20.0,
    //       vertical: 20.0,
    //     ),
    //     child: Container(
    //       margin: EdgeInsets.only(top: 20),

    //       height: size.height * 0.25,
    //       width: size.width * 1.0,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(30.0),
    //           image: new DecorationImage(image: AssetImage(imagecard))),
    //       // child: SizedBox(
    //       //   height: size.height * 0.25,

    //       //   // width: size.width * 0.9,
    //       //   child: BackgroundImage(
    //       //     image: imagecard,
    //       //   ),
    //       // ),
    //     ));
  }
}
