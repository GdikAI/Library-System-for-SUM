import 'package:e_commerce_app/components/book_item.dart';
import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeAllPage extends StatelessWidget {
  final String feedTitle;
  final List<Book> books;
  
  const SeeAllPage({
    super.key, 
    required this.feedTitle, 
    required this.books, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(feedTitle),
      ),
    
      body: Consumer<RepoOfBooks>(
        builder: (context, repo, child) {
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              Book book = books[index];
              return BookItem(
                book: book, 
              
                onPressed: () => repo.onFavoritePressed(book), 
                icon: Icon(
                  repo.isFavorite(book)
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                text: Text(book.lot>0?"В наличии": "Нет в наличии"),
              );
            },
          );
        },
      ),
    );
  }
}