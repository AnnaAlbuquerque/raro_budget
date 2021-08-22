import 'dart:convert';

class TransactionModel {
  String category;
  num value;
  String type;
  String name;
  int day;
  int month;
  int year;

  TransactionModel({
    required this.category,
    required this.value,
    required this.type,
    required this.name,
    required this.day,
    required this.month,
    required this.year,
  });

  TransactionModel copyWith({
    String? category,
    num? value,
    String? type,
    String? name,
    int? day,
    int? month,
    int? year,
  }) {
    return TransactionModel(
      category: category ?? this.category,
      value: value ?? this.value,
      type: type ?? this.type,
      name: name ?? this.name,
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'value': value,
      'type': type,
      'name': name,
      'day': day,
      'month': month,
      'year': year,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      category: map['category'],
      value: map['value'],
      type: map['type'],
      name: map['name'],
      day: map['day'],
      month: map['month'],
      year: map['year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(category: $category, value: $value, type: $type, name: $name, day: $day, month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.category == category &&
        other.value == value &&
        other.type == type &&
        other.name == name &&
        other.day == day &&
        other.month == month &&
        other.year == year;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        value.hashCode ^
        type.hashCode ^
        name.hashCode ^
        day.hashCode ^
        month.hashCode ^
        year.hashCode;
  }
}
