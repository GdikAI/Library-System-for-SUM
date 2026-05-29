import 'package:e_commerce_app/components/book_tile.dart';
import 'package:e_commerce_app/components/custom_appbar.dart';
import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:e_commerce_app/widgets/book_feed.dart';
import 'package:e_commerce_app/widgets/slider.dart';
import 'package:e_commerce_app/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  
  void addBookToFavorite(Book book) {
    Provider.of<RepoOfBooks>(context, listen: false).addBookInFavorite(book);
    //Сообщение о том, что пользователь добавил успешно книгу в избранное
    // showDialog(
    //   context: context, 
    //   builder:(context) => AlertDialog(
    //     title: Text("Вы успешно добавили книгу в Избранное!"),
    //     content: Text("Проверь свой список"),
    //     actions: [
    //       TextButton(
    //       onPressed: () {
    //         Navigator.pop(context); // Закрывает диалоговое окно при нажатии
    //       },
    //       child: const Text("ОК"),
    //     ),
    //     ],
    //   ),
    //   );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Consumer<RepoOfBooks>(
        builder: (context, value, child) => ListView(
          children: [
            //Карусель картинок
            const MySlider(),
            //Истории
            const Stories(),
            
            SizedBox(height: 10),

            //Подписи + Лента книг
            BookFeed(
              feedTitle: "Новинки", 
              books: value.getBookList(), 
              onFavoritePressed: (book) {
                if (value.isFavorite(book)) {
                  value.removeFromFavorite(book);
                } else {
                  addBookToFavorite(book);
                }
                  },
              isFavorite: value.isFavorite
              ),
            
          ],
        ),
      ),
    );
  }
}
