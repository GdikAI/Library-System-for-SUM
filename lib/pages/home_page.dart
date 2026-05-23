

import 'package:e_commerce_app/components/bottom_nav_bar.dart';
import 'package:e_commerce_app/components/custom_appbar.dart';
import 'package:e_commerce_app/pages/book_page.dart';
import 'package:e_commerce_app/pages/my_books_page.dart';
import 'package:e_commerce_app/pages/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottom nav bar
  int _selectedIndex = 0;
  
  //this method will update our selected index
  //when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //Book page
    const BookPage(),
    //Search page
    const SearchPage(),
    //MyBooksPage
    const MyBooksPage(),


  ];
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _selectedIndex==0,
      
      child: Scaffold(
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
      
        body: _pages[_selectedIndex],
      ),
    );
  }
}
