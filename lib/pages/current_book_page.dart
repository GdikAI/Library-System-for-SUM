import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class CurrentBookPage extends StatelessWidget {
  final Book book;

  const CurrentBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<RepoOfBooks>(
            builder: (context, repo, child) {
              return IconButton(
                onPressed: () => repo.onFavoritePressed(book),
                icon: Icon(
                  repo.isFavorite(book)
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              //Фото книги
              Container(
                color: Colors.grey[100],
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    book.imagePath,
                    width: 150,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5),
              //Автор
              Center(
                child: Text(book.autour, style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 8),
              //Название книги
              Text(
                book.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "О книге",
                  style: TextStyle(color: Colors.grey[400], fontSize: 15),
                ),
              ),
              //Описание книги
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReadMoreText(
                  book.description,
                  trimLines: 3,
                  textAlign: TextAlign.start,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Показать",
                  colorClickableText: Colors.blue[600],
                  trimExpandedText: "Свернуть",
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
          //Кнопка брони
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Consumer<RepoOfBooks>(
              builder: (BuildContext context, RepoOfBooks value, Widget? child) {
                return ElevatedButton(
                  onPressed: () {
                    if (value.isBooking(book)) {
                      value.removeFromBooking(book);
                    } else if (book.lot > 0) {
                      value.addBookInBooking(book);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Дорогой студент!"),
                          content: Text(
                            """К сожалению, эта книга уже нашла своего читателя.
Добавьте её в «Избранное», и мы сразу же сообщим вам, как только она вернётся в библиотеку. Так вы точно её не пропустите!""",
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  ); // Закрывает диалоговое окно при нажатии
                                },
                                child: const Text("ОК"),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: value.isBooking(book)
                        ? Colors.red
                        : (book.lot > 0 ? Colors.blue : Colors.white),

                    padding: EdgeInsets.symmetric(vertical: 25),
                  
                  ),
                  child: Text(
                    value.isBooking(book)
                        ? "Забронировано"
                        : (book.lot > 0
                              ? "Забронировать (осталось ${book.lot} шт)"
                              : "Нет в наличии"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: value.isBooking(book)
                          ? Colors.white
                          : (book.lot > 0 ? Colors.white : Colors.blue),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
