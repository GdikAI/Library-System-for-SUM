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
            onPressed: () => repo.onFavoritePressed(book) ,
            icon:  Icon(
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
        children: [ListView(
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
            SizedBox(height: 5,),
            //Автор
            Center(child: Text(book.autour,
                   style: TextStyle(color: Colors.black),
                   )),
            SizedBox(height: 8,),
            //Название книги
            Text(
              book.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
                ),
            SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("О книге",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15
                    
                  ),
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
              trimExpandedText: "Свернуть",
                          ),
           ),
           SizedBox(height: 100,)
          ],
        ),
    //Кнопка брони
     Positioned(
          left: 20,
          right: 20,
          bottom: 20, 
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:  book.inStock ? Colors.blueAccent : Colors.grey[200],
              foregroundColor:  book.inStock ? Colors.white : Colors.blueAccent,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: book.inStock? Text("Забронировать") : Text("Нет в наличии"),
          )
     ),
        ],
      ),
      
    );
  }
}
