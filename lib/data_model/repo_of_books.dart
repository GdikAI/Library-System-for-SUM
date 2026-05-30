import 'package:flutter/material.dart';
import 'package:e_commerce_app/data_model/book.dart';


class RepoOfBooks extends ChangeNotifier {
  //Список книг
  List<Book> newBooksList = [
    Book(
      name: "Смешарики: История большой вселенной",
       autour: "Арсений Попов", 
       inStock: true, 
       lot: 3, 
       status: "В наличии", 
       imagePath: 'lib/img/Смешарики.webp' 
       ),

   Book(
      name: "Английский",
       autour: "Антон Гордеевич Козлов", 
       inStock: true, 
       lot: 1, 
       status: "В наличии", 
       imagePath: 'lib/img/Английский.jpg'
        ),
    Book(
        name: "Чистый код",
        autour: "Роберт Мартин",
        inStock: true,
        lot: 5,
        status: "В наличии",
        imagePath: 'lib/img/Чистый_код.jpg',
        ),
      Book(
        name: "Мастер и Маргарита",
        autour: "М.А. Булгаков",
        inStock: true,
        lot: 5,
        status: "В наличии",
        imagePath: 'lib/img/Мастер_И_Маргарита.webp',
        ),

       Book(
        name: "Хоббит",
        autour: "Дж. Р. Р. Толкин",
        inStock: true,
        lot: 5,
        status: "В наличии",
        imagePath: 'lib/img/Хоббит.webp',
        ),
    ];

    late List<Book> iisRecomindations = [

        // Book(
        // name: "Чистый код",
        // autour: "Роберт Мартин",
        // inStock: true,
        // lot: 5,
        // status: "В наличии",
        // imagePath: 'lib/img/Чистый_код.jpg',
        // ),
        
        newBooksList[2],

        Book(
        name: "Вычислительные машины и разум",
         autour: "Алан Тьюринг",
          inStock: true, 
          lot: 3, 
          status: "В наличии", 
          imagePath: 'lib/img/Вычислительные_машины_и_разум.jpg'
          ),

           Book(
           name: "Изучаем Python",
           autour: "Эрик Мэтиз",
           inStock: true, 
           lot: 1, 
           status: "В наличии", 
           imagePath: 'lib/img/Изучаем_Python.webp'
          ),

           Book(
           name: "C++ для начинающих",
           autour: "Шилдт Герберт",
           inStock: true, 
           lot: 12, 
           status: "В наличии", 
           imagePath: 'lib/img/cpp_для_начинающих.webp'
          ),


    ];
    //Список избранного
    List<Book> userFavorite = [];

    //Геттер списка новых книг
    List<Book> getNewBookList() {
      return newBooksList;
    }

    List<Book> getIisRecomendations() {
      return iisRecomindations;
    }

    //Геттер избранного
    List<Book> getUserFavorite() {
      return userFavorite;
    }

    //Добавить книгу в избранное
    void addBookInFavorite(Book book) {
        userFavorite.add(book);
        notifyListeners();
    }

    void removeFromFavorite(Book book) {
      userFavorite.remove(book);
      notifyListeners();
    }

    bool isFavorite(Book book) {
      return userFavorite.contains(book);
    }

    void onFavoritePressed(Book book) {

      if (isFavorite(book)) {
          removeFromFavorite(book);
                } else {
                  addBookInFavorite(book);
                }
    }
    
}