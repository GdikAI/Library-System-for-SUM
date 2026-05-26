import 'package:e_commerce_app/data_model/story_model.dart';
import 'package:flutter/material.dart';

class StoryCircles extends StatelessWidget {
  final VoidCallback function;
  final StoryModel story;
  const StoryCircles({super.key, required this.function, required this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 68,
          width: 68,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(
              color: story.isWatched ? Colors.grey : Colors.red,
              width: 2.5,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(story.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
