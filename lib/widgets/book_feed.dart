import 'package:e_commerce_app/components/book_tile.dart';
import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:e_commerce_app/pages/see_all_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookFeed extends StatelessWidget {
  final String feedTitle;
  final List<Book> books;
  
  const BookFeed({
  super.key, 
  required this.feedTitle, 
  required this.books, 
  
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
                        onPressed: () => Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SeeAllPage(feedTitle: feedTitle, books: books))),
                        
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
            Consumer<RepoOfBooks>(
              builder: (context, value, child) { 

              return SizedBox(
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
                        value.addBookInFavorite(book);
              
                      }, 
                      isFavorite:  value.isFavorite(book),
                      );
               },
                  
                ),
              );
              },
            ),
  
      ],
    );
  }
}
