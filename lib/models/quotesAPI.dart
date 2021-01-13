import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class QuotesData {
  final String quote;
  final String author;

  QuotesData({
    @required this.quote,
    @required this.author,
  });
}

class Quotes with ChangeNotifier {
  List<QuotesData> _quotes = [];

  List<QuotesData> get quotes => [..._quotes];

  Future<List<QuotesData>> fetchQuotes() async {
    final String url = "http://192.168.43.50:8080/api";

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(extractedData);

    List<QuotesData> loadedData = [];
    for (var quote in extractedData["quotes"]) {
      loadedData.add(
        QuotesData(
          quote: quote["quote"],
          author: quote["author"],
        ),
      );
    }

    _quotes = loadedData;
    return quotes;
    // notifyListeners();
  }
}
