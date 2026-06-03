import 'package:e_commerce_app/data_model/book.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final List<Book> _history = [];

  List<Book> getHistory() {
    return _history;
  }

 void addToHistory(Book book) {
  // Удаляем старую запись по имени, чтобы избежать дубликатов
  _history.removeWhere((item) => item.name == book.name);
  
  // Добавляем в начало
  _history.insert(0, book);
  notifyListeners();
}

  void removeFromHistory(Book book) {
    if (_history.contains(book)) {
      _history.remove(book);
      notifyListeners();
    }
  }

  void clearAllHistory() {
    _history.clear();
    notifyListeners();
  }

  }
