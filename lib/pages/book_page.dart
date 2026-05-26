import 'package:e_commerce_app/components/custom_appbar.dart';
import 'package:e_commerce_app/widgets/slider.dart';
import 'package:e_commerce_app/widgets/stories.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: CustomAppBar(),
    body: Column( children: [
    //Image Slider
    const MySlider(),
    //Stories
    const Stories(),

   
      

    ],
    ),
   );
  }
}
