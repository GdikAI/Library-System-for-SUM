class Book {
  final String name;
  final String autour;
  bool inStock;
  int lot;
  String status;
  // final String description;
  final String imagePath;

  Book(
   {
    required this.name,
    required this.autour,
    required this.inStock,
    required this.lot,
    required this.status,
    // required this.description,
    required this.imagePath,
    }
    );
}