import 'package:e_commerce_app/components/book_tile.dart';
import 'package:e_commerce_app/data_model/book.dart';
import 'package:flutter/material.dart';

class BookFeed extends StatelessWidget {
  final String feedTitle;
  final List<Book> books;
  Function(Book) onFavoritePressed;
  final bool Function(Book) isFavorite;

  BookFeed({
  super.key, 
  required this.feedTitle, 
  required this.books, 
  required this.onFavoritePressed, 
  required this.isFavorite,
  }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
              //Подписи
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        feedTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 24,
                          ),
                      ),
                      TextButton(
                        onPressed: () {
                          
                        },
                        
                        child: Text(
                          "Все",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
            //Лента книг
            SizedBox(
              height: 300,
        
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  //Получение книги
                  Book book = books[index];
                  return BookTile(
                    book: book,
                    onPressed: () {
                      onFavoritePressed(book);

                    }, 
                    isFavorite: isFavorite(book),
                    );
                },
              ),
            ),
      ],
    );
  }
}