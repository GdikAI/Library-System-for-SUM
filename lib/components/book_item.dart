import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/pages/current_book_page.dart';
import 'package:flutter/material.dart';


class BookItem extends StatefulWidget {
  Book book;
  Icon icon;
  Text? text;
  VoidCallback onPressed;
  BookItem({
  super.key, 
  required this.book,
  required this.onPressed,
  required this.icon,
  this.text
  });

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
 

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentBookPage(book: widget.book))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          ),
        
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Image.asset(widget.book.imagePath),
          title: Text(widget.book.name),
          subtitle: widget.text,
          trailing: IconButton(
            icon: widget.icon,
            onPressed: widget.onPressed, 
            ),
        ),
      ),
    );
  }
}