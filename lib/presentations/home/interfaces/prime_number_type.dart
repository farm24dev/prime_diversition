import 'package:flutter/material.dart';

enum PrimeNumberType {
  prime,
  notPrime,
}

extension PrimeNumberTypeExtension on PrimeNumberType {
  String get display {
    switch (this) {
      case PrimeNumberType.prime:
        return 'เป็นจำนวนเฉพาะ';
      case PrimeNumberType.notPrime:
        return 'ไม่ใช่จำนวนเฉพาะ';
    }
  }

  Color get color {
    switch (this) {
      case PrimeNumberType.prime:
        return Colors.green;
      case PrimeNumberType.notPrime:
        return Colors.red;
    }
  }
}
