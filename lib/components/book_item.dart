import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookItem extends StatefulWidget {
  Book book;
  BookItem({
  super.key, 
  required this.book
  });

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  //Удалить книжку из избранного
  void removeItemFromFavorit() {
    Provider.of<RepoOfBooks>(context, listen: false).removeFromFavorite(widget.book);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        ),
  
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.book.imagePath),
        title: Text(widget.book.name),
        subtitle: Text(widget.book.status),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromFavorit, 
          ),
      ),
    );
  }
}