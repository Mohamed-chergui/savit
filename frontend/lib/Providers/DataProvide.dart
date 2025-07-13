import 'package:flutter/material.dart';
import 'package:wordsapp/Services/Apiservice.dart';


class DataProvider with ChangeNotifier {
  String _data = '';
  String get data => _data;

  final ApiService _apiService = ApiService();

  Future<void> fetchData() async {
    try {
      final result = await _apiService.fetchData('/api/data');
      _data = result['message'];
      notifyListeners();
    } catch (e) {
    }
  }
}