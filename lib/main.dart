import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:e_commerce_app/data_model/search_provider.dart';
import 'package:e_commerce_app/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => RepoOfBooks()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
        ),
      ) ,

    );
        
      

  }
}