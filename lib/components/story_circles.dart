import 'package:e_commerce_app/data_model/story_model.dart';
import 'package:flutter/material.dart';

class StoryCircles extends StatelessWidget {
  final VoidCallback function;
  final StoryModel story;
  const StoryCircles({
    super.key,
    required this.function,
    required this.story
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            ),
          ),
    );
  }
}