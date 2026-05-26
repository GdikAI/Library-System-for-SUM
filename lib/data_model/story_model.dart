import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryModel {
  final int id;
  // final String name;
  final List<StoryItem> storyItems;
  bool isWatched;
  StoryController controller;
  int currentItemIndex = 0;

  StoryModel({
    required this.id,
    // required this.name,
    required this.storyItems,
    this.isWatched = false,
    StoryController? controller,
  }) : this.controller = controller ?? StoryController();
}