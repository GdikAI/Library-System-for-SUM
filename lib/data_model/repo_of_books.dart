import 'package:flutter/material.dart';
import 'package:e_commerce_app/data_model/book.dart';


class RepoOfBooks extends ChangeNotifier {
  //Список книг

  List<Book> allBooksList = [Book(
      name: "Смешарики: История большой вселенной",
       autour: "Мария Корнилова", 
       inStock: true, 
       lot: 3, 
    
       imagePath: 'lib/img/Смешарики.webp', 
       description: 
       """- Миллионы фанатов по всему миру
- Более 600 отснятых серий.
- 6 спин-оффов и 3 полнометражных фильма.

Все это о них, о Смешариках, на которых успело вырасти несколько поколений детей.
А ведь на заре 2000-х, когда все только начиналось, никто и подумать не мог, что двум парням — Илье Попову и Салавату Шайхинурову — удастся невозможное: с нуля, без опыта в мультипликации, создать первый в России анимационный сериал, который обойдет по популярности зарубежные франшизы. 
 
Эта книга — искренняя история о том, как рождалась, росла, находилась на грани краха и снова набирала силу Вселенная Смешариков. Написанная свидетелем событий, сценарным редактором проекта Марией Корниловой, книга рассказывает о том, что долгое время оставалось за кадром:
- почему на старте никто не верил в успех проекта;
- какими были бы Совунья, Нюша, Лосяш, Пин и Ежик, сложись все немного иначе;
- кто такие Духи Ромашковой долины и почему с ними не стоит ссориться.""", 
      fullAuthourName: ''
       ),

   Book(
      name: "Английский",
       autour: "А.Г. Козлов", 
       inStock: true, 
       lot: 1, 
 
       imagePath: 'lib/img/Английский.jpg', 
       description: '', 
       fullAuthourName: ''
        ),
    Book(
        name: "Чистый код",
        autour: "Роберт Мартин",
        inStock: false,
        lot: 0,
    
        imagePath: 'lib/img/Чистый_код.jpg', 
        description: 
        """Плохой код может работать, но он будет мешать развитию проекта и компании-разработчика, требуя дополнительные ресурсы на поддержку и «укрощение».
Каким же должен быть код? Эта книга полна реальных примеров, позволяющих взглянуть на код с различных направлений: сверху вниз, снизу вверх и даже изнутри. Вы узнаете много нового о коде. Более того, научитесь отличать хороший код от плохого, узнаете, как писать хороший код и как преобразовать плохой код в хороший.

Книга состоит из трех частей. Сначала вы познакомитесь с принципами, паттернами и приемами написания чистого кода. Затем приступите к практическим сценариям с нарастающей сложностью — упражнениям по чистке кода или преобразованию проблемного кода в менее проблемный. И только после этого перейдете к самому важному — концентрированному выражению сути этой книги — набору эвристических правил и «запахов кода». Именно эта база знаний описывает путь мышления в процессе чтения, написания и чистки кода.""", fullAuthourName: '',
        ),
      Book(
        name: "Мастер и Маргарита",
        autour: "М.А. Булгаков",
        inStock: true,
        lot: 5,
    
        imagePath: 'lib/img/Мастер_И_Маргарита.webp',
         description: '', 
        fullAuthourName: '',
        ),

       Book(
        name: "Хоббит",
        autour: "Дж. Р. Р. Толкин",
        inStock: true,
        lot: 5,
      
        imagePath: 'lib/img/Хоббит.webp', 
        description: '', 
        fullAuthourName: '',
        ),
       Book(
        name: "Вычислительные машины и разум",
         autour: "Алан Тьюринг",
          inStock: true, 
          lot: 3, 
         
          imagePath: 'lib/img/Вычислительные_машины_и_разум.jpg', description: '', fullAuthourName: ''
          ),

           Book(
           name: "Изучаем Python",
           autour: "Эрик Мэтиз",
           inStock: true, 
           lot: 1, 
         
           imagePath: 'lib/img/Изучаем_Python.webp', description: '', fullAuthourName: ''
          ),

           Book(
           name: "C++ для начинающих",
           autour: "Шилдт Герберт",
           inStock: true, 
           lot: 12, 
         
           imagePath: 'lib/img/cpp_для_начинающих.webp', description: '', fullAuthourName: ''
          ),
        ];

  late List<Book> newBooksList = [
    allBooksList[0],

    allBooksList[1],
    
    allBooksList[2],

    allBooksList[3],

    allBooksList[4],
    ];

    late List<Book> iisRecomindations = [
        
        newBooksList[2],

        allBooksList[5],

        allBooksList[6],
        
        allBooksList[7]


    ];
    //Список избранного
    List<Book> userFavorite = [];

    //Список забронированных книг
    List<Book> userBooking = [];

    //Геттер списка новых книг
    List<Book> getNewBookList() {
      return newBooksList;
    }
    //Геттер списка рекомендуемых ИИС'ом книг
    List<Book> getIisRecomendations() {
      return iisRecomindations;
    }

    //Геттер избранного
    List<Book> getUserFavorite() {
      return userFavorite;
    }
    //Геттер забронированного
    List<Book> getUserBooking() {
      return userBooking;
    }

    //Добавить книгу в избранное
    void addBookInFavorite(Book book) {
        if (!isFavorite(book)) {
        userFavorite.add(book);
        print(book.hashCode);
        notifyListeners();
        }
    }

    //Добавить книгу в забронированное
    void addBookInBooking(Book book) {
      if (book.lot>0 && !isBooking(book)) {
      userBooking.add(book);
      book.lot--;
      }
      notifyListeners();
    }
    
    //Удалить книгу из избранного
    void removeFromFavorite(Book book) {
      
      userFavorite.remove(book);
      notifyListeners();

    }

    //Удалить книгу из забронированного
    void removeFromBooking(Book book) {
      
      userBooking.remove(book);
      book.lot++;
      notifyListeners();
      
     
  
    }

    bool isFavorite(Book book) {
      return userFavorite.contains(book);
    }

    bool isBooking(Book book) {
      return userBooking.contains(book);
    }

    void onFavoritePressed(Book book) {

      if (isFavorite(book)) {
          removeFromFavorite(book);
                } else {
                  addBookInFavorite(book);
                }
    }
    
     void onBookingPressed(Book book) {

      if (isBooking(book)) {
          removeFromBooking(book);
                } else {
          addBookInBooking(book);
                }
    }

}