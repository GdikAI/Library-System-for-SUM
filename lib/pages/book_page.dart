import 'package:e_commerce_app/components/book_tile.dart';
import 'package:e_commerce_app/components/custom_appbar.dart';
import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
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
    showDialog(
      context: context, 
      builder:(context) => AlertDialog(
        title: Text("Вы успешно добавили книгу в Избранное!"),
        content: Text("Проверь свой список"),
        actions: [
          TextButton(
          onPressed: () {
            Navigator.pop(context); // Закрывает диалоговое окно при нажатии
          },
          child: const Text("ОК"),
        ),
        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Consumer<RepoOfBooks>(
        builder: (context, value, child) => ListView(
          children: [
            //Image Slider
            const MySlider(),
            //Stories
            const Stories(),
            //Подписи
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Новинки в библиотеке",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    "Все",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //Лента книг
            SizedBox(
              height: 300,
        
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.getBookList().length,
                itemBuilder: (context, index) {
                  //Получение книги
                  Book book = value.getBookList()[index];
                  return BookTile(
                    book: book,
                    onPressed: () {
                      if (value.isFavorite(book)) {
                        value.removeFromFavorite(book);
                      }else {
                        value.addBookInFavorite(book);
                      }

                    }, 
                    isFavorite: value.isFavorite(book),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
