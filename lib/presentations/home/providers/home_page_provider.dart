import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prime_diversition/presentations/home/interfaces/prime_number_type.dart';

class HomePageProvider extends ChangeNotifier {
  HomePageProvider() {
    log('HomePageProvider created');
    _inputController.addListener(() {
      if (_inputController.text.isEmpty) {
        _primeNumberType = null;
      }
      notifyListeners();
    });
  }
  final TextEditingController _inputController = TextEditingController();
  TextEditingController get inputController => _inputController;

  PrimeNumberType? _primeNumberType;
  PrimeNumberType? get primeNumberType => _primeNumberType;
  double _timeCalculate = 0;
  double get timeCalculate => _timeCalculate;

  void checkPrimeNumber() {
    log('checkPrimeNumber invoked');
    try {
      String inputText = _inputController.text.trim();
      if (inputText.isEmpty) {
        return;
      }

      final stopwatch = Stopwatch()..start();
      int number = int.parse(inputText);
      if (number < 2) {
        log('$number is not a prime number');
        _primeNumberType = PrimeNumberType.notPrime;
        stopwatch.stop();
        _timeCalculate = stopwatch.elapsedMicroseconds / 1000.0;
        log('checkPrimeNumber timeCalculate: $_timeCalculate ms');
        notifyListeners();
        return;
      }

      bool isPrime = true;
      for (int i = 2; i < number; i++) {
        if (number % i == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        log('$number is a prime number');
        _primeNumberType = PrimeNumberType.prime;
      } else {
        log('$number is not a prime number');
        _primeNumberType = PrimeNumberType.notPrime;
      }
      stopwatch.stop();
      _timeCalculate = stopwatch.elapsedMicroseconds / 1000.0;
      log('checkPrimeNumber timeCalculate: $timeCalculate ms');
      notifyListeners();
    } catch (e) {
      log('checkPrimeNumber catch error: $e');
    }
  }

  void clearInput() {
    _inputController.clear();
    _primeNumberType = null;
    _timeCalculate = 0;
    notifyListeners();
  }

  bool get isInputEmpty => _inputController.text.isEmpty;
}
