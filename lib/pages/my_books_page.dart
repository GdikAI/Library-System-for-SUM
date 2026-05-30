import 'package:e_commerce_app/components/book_item.dart';
import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({super.key});

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: 
          Text("Мои книги")
          ),
          ),
          body: Consumer<RepoOfBooks>(builder:(context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Избранное
            Text(
            "Избранное",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 24,
              

              ),
            ),
            Expanded(
              child: ListView.builder(
              itemCount: value.getUserFavorite().length ,
              itemBuilder: (context, index) {
              //Получить книги
              Book individualBook = value.getUserFavorite()[index];
            

              //Вернуть книгу в избранное
              return BookItem(book: individualBook, 
              onPressed: () {
                value.removeFromFavorite(individualBook);
                }, 
              icon: Icon(Icons.delete),);

            } ,))



            //Мои забронированные книги



          ],
        ), 
      ) 
    );
  }
}