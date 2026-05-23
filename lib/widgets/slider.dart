import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {

  //List with images
  List <String> images = [
    'https://sun9-47.userapi.com/s/v1/ig2/mOURDvwWhD-iq5eHisSqlNNWZRyrbQ16qEunpxgWSDE-Jj-yMPc63y7j_2h9GbtibYXUXcJoTiB8FvViBEBpPQj9.jpg?quality=95&as=32x21,48x32,72x48,108x72,160x107,240x160,360x240,480x320,540x360,640x427,720x480,1080x720,1280x853,1440x960,1536x1024&from=bu&u=OtuO9fKvjfTL6twpBgSrXqIWEV05XssH5sH66cyW5I0&cs=1536x0',
    'https://sun9-19.userapi.com/s/v1/ig2/y96rPvZtPPp0Ktb6Yi31gkxSh33D-WXHSNtFq4Q44vuNbGQFY5KueFvwfr-O5y-Tt8baKCtS7ziBFb03JiF15laD.jpg?quality=95&as=32x23,48x34,72x51,108x77,160x113,240x170,360x255,480x341,540x383,640x454,720x511,1080x766,1170x830&from=bu&u=pjtZQQlVuyxPZkEN1M94_WwWJsdEsSRG63JbLUDsiZ4&cs=1170x0',
    'https://sun9-79.userapi.com/s/v1/ig2/1-0EkazYAE8ybNXXVyqhbfCXxob2N5Xvlc1PUjZSHG6DnguKlii9uVGETPOUtaW2uFef09_48FM7kSyThVVaCMmY.jpg?quality=95&as=32x21,48x32,72x48,108x72,160x107,240x160,360x240,480x320,540x360,640x426,720x480,1080x720,1280x853&from=bu&u=gWwiWmO2qFkW39SpMEmULUekzuVQhXTmO4rXbMzZ4dE&cs=1280x0',
     ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: CarouselSlider(items: images.map((item) => Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(item),fit: BoxFit.cover)
          ),
        ),
        ).toList(), options: CarouselOptions(
          height: 250,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 8),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          enlargeCenterPage: true,
          aspectRatio: 16/9,
          viewportFraction: 1,


            )
          ),
          
        );
  }
}