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




class _StoriesState extends State<Stories> {
final List<StoryModel> _storiesList = [
    StoryModel(
      id: 1,
     storyItems: [
      StoryItem.pageImage(
      url: 'https://avatars.mds.yandex.net/i?id=77962313e184f71d75a7587dbcd6352c_l-5873467-images-thumbs&n=13',
      controller: StoryController()
      ),
      
     ], 
     img: 'https://avatars.mds.yandex.net/get-entity_search/2044927/478603152/S600xU_2x',  

      ),
   StoryModel(
      id: 2,
     storyItems: [
      StoryItem.pageImage(
      url: 'https://fsd.multiurok.ru/html/2017/09/30/s_59cffdc653f3b/img35.jpg',
      controller: StoryController()
      ),
     ], 
     img: 'https://avatars.mds.yandex.net/get-entity_search/7765675/1274606382/S600xU_2x',  
      ),
     StoryModel(
      id: 3,
     storyItems: [
      StoryItem.pageImage(url: 'https://iis.guu.ru/wp-content/uploads/WhatsApp-Image-2020-05-27-at-14.57.53.jpeg', controller: StoryController()),
      
      StoryItem.pageImage(
      url: 'https://avatars.mds.yandex.net/i?id=77962313e184f71d75a7587dbcd6352c_l-5873467-images-thumbs&n=13',
      controller: StoryController()
      )
     ], 
     img: 'https://vashvuz.ru/wp-content/uploads/2023/05/guu.png',  
      ),
      StoryModel(
        id: 4, 
        storyItems: [
          StoryItem.text(title: "ЗАВТРА БИБЛИОТЕКА НЕ РАБОТАЕТ:\n САНИТАРНЫЙ ДЕНЬ", backgroundColor: Colors.red),
          StoryItem.text(title: "30.05.2026 Коворкинг будет закрыт на мероприятие", backgroundColor: Colors.red),
        ], 
        img: 'https://avatars.mds.yandex.net/i?id=8f13685e194cb72c385146aca8ac030d5dad130e-16459038-images-thumbs&n=13' 
        ),
       StoryModel(
        id: 4, 
        storyItems: [
          StoryItem.text(title: "ЗАВТРА БИБЛИОТЕКА НЕ РАБОТАЕТ:\n САНИТАРНЫЙ ДЕНЬ", backgroundColor: Colors.red),
          StoryItem.text(title: "30.05.2026 Коворкинг будет закрыт на мероприятие", backgroundColor: Colors.yellow),
        ], 
        img: 'https://avatars.mds.yandex.net/i?id=8f13685e194cb72c385146aca8ac030d5dad130e-16459038-images-thumbs&n=13' 
        ),


  ];
  void _openStory(int index) async {
    _storiesList[index].currentItemIndex = 0;

    await Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => 
    StoryPage(
    stories: _storiesList , 
    initialIndex: index,
        ),
      ),
    );
    setState(() {});
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