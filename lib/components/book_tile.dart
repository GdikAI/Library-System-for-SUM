import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:e_commerce_app/pages/current_book_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CurrentBookPage(book: book)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          width: 140,
        

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

                  //Название книги
                  Text(
                    book.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  //Автор
                  Text(
                    book.autour,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  //Статус наличия (кнопка брони)
                 
                    Consumer<RepoOfBooks>(
                      builder: (context, value, child) { 

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: value.isBooking(book) ? Colors.red : (book.lot>0?Colors.blue:Colors.white)),
                        
                        onPressed: () {
                          if (value.isBooking(book)) {
                            value.removeFromBooking(book);
                          } else if (book.lot > 0) {
                          value.addBookInBooking(book);

                          } else {
                            showDialog(context: context, builder: (context) => AlertDialog(
                          title: Text("Уважаемый читатель!"),
                          content: Text("""К сожалению, эта книга уже нашла своего читателя.
Добавьте её в «Избранное», и мы сразу же сообщим вам, как только на склад заглянет новый тираж. Так вы точно её не пропустите!"""),
                          actions: [
                            TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Закрывает диалоговое окно при нажатии
                            },
                            child: const Text("ОК"),)

                           
                          ],
                        ),
                        );
                          
                          }
                          },
                        child: SizedBox(
                          width: 140,
                          child: 
                          Text(value.isBooking(book) ?  
                          "Забронировано" 
                          :(book.lot>0 
                          ? "Забронировать" 
                          : "Нет в наличии"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                           
                            color: value.isBooking(book)? Colors.white : (book.lot>0?Colors.white:Colors.blue)
                          ),
                          ),
                          
                        ),
                       );
                       },
                    ),
                ],
              ),
              //Иконка "Избранное"
              Positioned(
                top: -12,
                right: -8,
                child: IconButton(
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(6),
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.blue : Colors.blue,
                    size: 22,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
