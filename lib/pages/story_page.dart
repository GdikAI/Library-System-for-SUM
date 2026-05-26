import 'package:e_commerce_app/data_model/story_model.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPage extends StatefulWidget {
  final List<StoryModel> stories; //список сторисов
  final int initialIndex;            //индекс рубрики, на которую нажали

  const StoryPage({
    super.key, 
    required this.stories,
    required this.initialIndex,
    });

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _handleStoryComplete() {
    if (currentIndex < widget.stories.length - 1) {
      // Если это не последняя рубрика в списке, переключаемся на следующую
      setState(() {
        currentIndex++;
      });
    } else {
      // Если рубрики закончились, закрываем экран сторис
      Navigator.pop(context);
    }
  }

  void _handleStoryPrevios() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = widget.stories[currentIndex];
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
      
        child: Stack(
            key: UniqueKey(),
            children: [StoryView(
            repeat: false,
            storyItems: currentStory.storyItems,
            controller: currentStory.controller,
            onComplete: _handleStoryComplete, 
            onStoryShow: (storyItem, index) {
              currentStory.currentItemIndex = index;
            },
            
                
                onVerticalSwipeComplete: (direction) {
                  if (direction == Direction.down) Navigator.pop(context);
                },
                
          ),
         Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: screenWidth * 0.20, 
              child: GestureDetector(
                behavior: HitTestBehavior.translucent, // Пропускает тапы сквозь себя
                onTapDown: (_) {
                  // Если пользователь нажал в левую зону И мы на самом ПЕРВОМ слайде этой рубрики
                  if (currentStory.currentItemIndex == 0) {
                          
                    currentIndex == 0
                        ? currentStory.controller = StoryController() 
                        : _handleStoryPrevios();                    

                    setState(() {}); 
                  }
                 
                },
              ),
            ), 
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                onPressed: () => Navigator.pop(context),
              ), 
            )
        ]),
  
        ),
        
    );
  }
}