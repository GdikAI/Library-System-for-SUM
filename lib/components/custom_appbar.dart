import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:e_commerce_app/widgets/search.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Search(repo: RepoOfBooks(),),
          ),
          //IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_sharp)),
        ],
      ),
    ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}