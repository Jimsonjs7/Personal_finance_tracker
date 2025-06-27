import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyProvider with ChangeNotifier {
  String _baseCurrency = 'INR';
  String _targetCurrency = 'INR';
  double _conversionRate = 1.0;

  String get baseCurrency => _baseCurrency;
  String get targetCurrency => _targetCurrency;
  double get conversionRate => _conversionRate;

  Future<void> updateCurrency(String newCurrency) async {
    if (_targetCurrency == newCurrency) return;

    final url = Uri.parse('https://api.exchangerate.host/convert?from=$_baseCurrency&to=$newCurrency');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final rate = jsonDecode(response.body)['result'];
      _targetCurrency = newCurrency;
      _conversionRate = rate ?? 1.0;
      notifyListeners();
    } else {
      throw Exception('Failed to fetch exchange rate');
    }
  }

  double convert(double amount) {
    return amount * _conversionRate;
  }

  String getCurrencySymbol() {
    switch (_targetCurrency) {
      case 'USD': return '\$';
      case 'EUR': return '€';
      case 'GBP': return '£';
      case 'INR': return '₹';
      default: return _targetCurrency;
    }
  }
}
