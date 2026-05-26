import 'package:e_commerce_app/data_model/story_model.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPage extends StatefulWidget {
  final List<StoryModel> stories; //список сторисов
  final int initialIndex;         //индекс рубрики, на которую нажали

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
  int _resetCounter = 0; 

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _handleStoryComplete() {
    widget.stories[currentIndex].isWatched = true;
    if (currentIndex < widget.stories.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _handleStoryPrevios() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        final prevStory = widget.stories[currentIndex];
        prevStory.currentItemIndex = prevStory.storyItems.length - 1;
        prevStory.controller = StoryController(); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = widget.stories[currentIndex];
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              // <-- 2. Меняем ключ! Теперь он зависит и от индекса, и от счетчика сброса
              key: ValueKey('story_${currentIndex}_$_resetCounter'),
              child: StoryView(
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
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: screenWidth * 0.25, 
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (_) {
                  if (currentStory.currentItemIndex == 0) {
                    if (currentIndex == 0) {
                    
                      setState(() {
                        currentStory.controller = StoryController(); 
                        _resetCounter++; 
                      });
                    } else {
                      _handleStoryPrevios();
                    }
                  } else {
                    currentStory.controller.previous();
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
          ],
        ),
      ),
    );
  }
}