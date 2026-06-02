import 'package:flutter/widgets.dart';

class Book {
  final String name;
  final String autour;
  final String fullAuthourName;
  int lot;
  bool inStock;
 
  final String description;
  final String imagePath;

  Book(
   {
    required this.name,
    required this.autour,
    required this.fullAuthourName, 
    required this.lot,
    required this.inStock,
   
    required this.description,
    required this.imagePath,
    }
    );
}