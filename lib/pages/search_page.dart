import 'package:e_commerce_app/components/custom_appbar.dart';
import 'package:e_commerce_app/data_model/search_provider.dart';
import 'package:e_commerce_app/pages/current_book_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, child) {
        final historyList = searchProvider.getHistory();
        return Scaffold(
          appBar: CustomAppBar(),
          body: ListView.builder(
            itemCount: searchProvider.getHistory().length,
            itemBuilder: (context, index) {
              final book = historyList[index];
              return ListTile(
                leading: const Icon(Icons.history),
                title: Text(book.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrentBookPage(book: book),
                    ),
                  );
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(
                        "Вы хотите удалить книгу из истории поиска?",
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                ); // Закрывает диалоговое окно при нажатии
                              },
                              child: const Text("Нет"),
                            ),

                            TextButton(
                              onPressed: () {
                                searchProvider.removeFromHistory(book);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Да",
                                style: TextStyle(color: Colors.red,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          floatingActionButton: historyList.isEmpty
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Вы точно хотите удалить всю историю поиска?",
                          style: TextStyle(fontSize: 18),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  ); // Закрывает диалоговое окно при нажатии
                                },
                                child: const Text("Нет"),
                              ),

                              TextButton(
                                onPressed: () {
                                  searchProvider.clearAllHistory();
                                  ;
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Да",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  backgroundColor: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
        );
      },
    );
  }
}
