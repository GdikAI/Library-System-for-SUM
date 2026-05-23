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
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(232, 232, 224, 224),
          hintText: "Поиск",
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 20,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          )
        ),
      ),
    ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}