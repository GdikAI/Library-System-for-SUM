
import 'package:story_view/story_view.dart';

class StoryModel {
  final int id;
  // final String name;
  final List<StoryItem> storyItems;
  final String img;
  bool isWatched;
  StoryController controller;
  int currentItemIndex = 0;

  StoryModel({
    required this.id,
    // required this.name,
    required this.storyItems,
    required this.img,
    this.isWatched = false,
    StoryController? controller,
  }) : this.controller = controller ?? StoryController();
}