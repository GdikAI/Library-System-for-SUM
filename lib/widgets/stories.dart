import 'package:e_commerce_app/components/story_circles.dart';
import 'package:e_commerce_app/data_model/story_model.dart';
import 'package:e_commerce_app/pages/story_page.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}


final List<StoryModel> _storiesList = [
    StoryModel(
      id: 1,
     storyItems: [
      StoryItem.pageImage(
      url: 'https://avatars.mds.yandex.net/i?id=77962313e184f71d75a7587dbcd6352c_l-5873467-images-thumbs&n=13',
      controller: StoryController()
      ),
     ],  
      ),
   StoryModel(
      id: 2,
     storyItems: [
      StoryItem.pageImage(
      url: 'https://i.pinimg.com/736x/9f/1d/cf/9f1dcfcb1906b95931462a1be7ae2c5a.jpg',
      controller: StoryController()
      ),
     ],  
      ),
     StoryModel(
      id: 3,
     storyItems: [
      StoryItem.pageImage(
      url: 'https://avatars.mds.yandex.net/i?id=77962313e184f71d75a7587dbcd6352c_l-5873467-images-thumbs&n=13',
      controller: StoryController()
      ),
      StoryItem.pageImage(
      url: 'https://avatars.mds.yandex.net/i?id=77962313e184f71d75a7587dbcd6352c_l-5873467-images-thumbs&n=13',
      controller: StoryController()
      )
     ],  
      ),
      StoryModel(
        id: 4, 
        storyItems: [
          StoryItem.text(title: "ЗАВТРА БИБЛИОТЕКА НЕ РАБОТАЕТ:\n САНИТАРНЫЙ ДЕНЬ", backgroundColor: Colors.red)
        ] )
  ];


class _StoriesState extends State<Stories> {
  void _openStory(int index) {
    Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => 
    StoryPage(
    stories: _storiesList , 
    initialIndex: index,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: _storiesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final currentStory = _storiesList[index];
              return StoryCircles(
                story: currentStory,
                function: () => _openStory(index),
              );
            },
          ),
        )
      ],
    );
  }
}