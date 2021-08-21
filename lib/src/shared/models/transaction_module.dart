import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModule {
  String category;
  num value;
  String type;
  String name;
  Timestamp date;
  TransactionModule({
    required this.category,
    required this.value,
    required this.type,
    required this.name,
    required this.date,
  });

  TransactionModule copyWith({
    String? category,
    double? value,
    String? type,
    String? name,
    Timestamp? date,
  }) {
    return TransactionModule(
      category: category ?? this.category,
      value: value ?? this.value,
      type: type ?? this.type,
      name: name ?? this.name,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'value': value,
      'type': type,
      'name': name,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory TransactionModule.fromMap(Map<String, dynamic> map) {
    return TransactionModule(
      category: map['category'],
      value: map['value'] / 100,
      type: map['type'],
      name: map['name'],
      date: (map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModule.fromJson(String source) =>
      TransactionModule.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModule( category: $category, value: $value, type: $type, name: $name, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModule &&
        other.category == category &&
        other.value == value &&
        other.type == type &&
        other.name == name &&
        other.date == date;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        value.hashCode ^
        type.hashCode ^
        name.hashCode ^
        date.hashCode;
  }
}
