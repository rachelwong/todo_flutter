import 'dart:core';

class Fact {
  final String fact;
  final int length;

  const Fact({required this.fact, required this.length});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      fact: json['fact'],
      length: json['length'],
    );
  }
}
