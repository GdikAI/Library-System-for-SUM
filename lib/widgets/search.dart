import 'package:e_commerce_app/data_model/book.dart';
import 'package:e_commerce_app/data_model/repo_of_books.dart';
import 'package:e_commerce_app/data_model/search_provider.dart';
import 'package:e_commerce_app/pages/current_book_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
 
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void addInHistory(Book book) {
    
Provider.of<SearchProvider>(context, listen: false).addToHistory(book);
  }

  @override
  Widget build(BuildContext context) {

    final repo = Provider.of<RepoOfBooks>(context, listen: false);
    List<String> bookNames = repo.allBooksList.map((book) => book.name).toList();
    return Stack(
      children: [
        SearchAnchor.bar(suggestionsBuilder:(context, controller) {
          final String input = controller.text.toLowerCase();

          return bookNames
                .where((String name) => name.toLowerCase().contains(input))
                .map((String filteredName) => ListTile(
                  title: Text(filteredName),
                  onTap: () {
                      Book selectedBook = repo.allBooksList.firstWhere(
                        (book) => book.name == filteredName,
                      );
                      controller.closeView(filteredName);
                      controller.clear();
                      addInHistory(selectedBook);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentBookPage(book: selectedBook)));
                  },
                ))
                .toList();
          
        },
         )  

  
      ],
    );
  }
}