import 'package:e_commerce_app/data_model/book.dart';
import 'package:flutter/material.dart';


class BookTile extends StatelessWidget {
  Book book;
  void Function()? onPressed;
  final bool isFavorite;
  BookTile({
    super.key, 
    required this.book,
    required this.onPressed, 
    required this.isFavorite,
    });

 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 140,

      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Картинка книги
              Image.asset(
                book.imagePath,
                width: 140,
                height: 210,
                fit: BoxFit.cover,
              ),

              //Описание
              // Text(
              // book.description,
              // style: TextStyle(color: Colors.grey[600],
              // fontSize: 14),
              // ),

              //Название книги
              Text(
                book.name,
                textAlign: TextAlign.center,
              
                ),

              //Автор
              Text(
              book.autour, 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600]
                )
                ),

              //Статус наличия (кнопка брони)
            ],
          ),
          //кнопка "Избранное"
          Positioned(
            top: -12,
            right: -8,
            child: IconButton(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(6),
              icon: Icon(
                isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
                color: isFavorite
                       ?Colors.red
                       :Colors.blue,
                size: 22,
                ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
