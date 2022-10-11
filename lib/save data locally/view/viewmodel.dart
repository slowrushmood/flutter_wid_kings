import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterwidgets/save%20data%20locally/model/localstorage.dart';
import 'package:flutterwidgets/save%20data%20locally/service/boxes.dart';

final quoteViewModelProvider =
    ChangeNotifierProvider((_) => QuoteViewModelProvider());

class QuoteViewModelProvider extends ChangeNotifier {
  final boxKey = 'quotes';
  bool _canSave = false;
  bool get canSave => _canSave;

  String _myQuote = '';
  String get myQuote => _myQuote;

  Future<void> saveQuote({
    required String quote,
  }) async {
    // initialize box
    final box = Boxes.getStorageBox();
    try {
      if (quote.trim().isNotEmpty) {
        //create quotes
        final newQuote = LocalStrorage()..paragraph = quote;

        // then save
        box.put(boxKey, newQuote);

        // then trigger change notifier
        notifyListeners();
      } else {
        debugPrint('no quotes to save');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void checkAndSaveInput({String? existingQuote, String? editQuote}) {
    if (existingQuote!.trim() == editQuote) {
      _canSave = false;
      notifyListeners();
    } else {
      _canSave = true;
      notifyListeners();
    }

    if (editQuote != null) {
      _myQuote = editQuote;
      notifyListeners();
    }
  }
}
