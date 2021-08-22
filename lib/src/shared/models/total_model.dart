import 'dart:convert';

class TotalModel {
  double totalIn;
  double totalOut;
  int month;
  TotalModel({
    required this.totalIn,
    required this.totalOut,
    required this.month,
  });

  TotalModel copyWith({
    double? totalIn,
    double? totalOut,
    int? month,
  }) {
    return TotalModel(
      totalIn: totalIn ?? this.totalIn,
      totalOut: totalOut ?? this.totalOut,
      month: month ?? this.month,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalIn': totalIn,
      'totalOut': totalOut,
      'month': month,
    };
  }

  factory TotalModel.fromMap(Map<String, dynamic> map) {
    return TotalModel(
      totalIn: map['totalIn'] != null ? map['totalIn'] / 100 : 0,
      totalOut: map['totalOut'] != null ? map['totalOut'] / 100 : 0,
      month: map['month'] ?? DateTime.now().month,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalModel.fromJson(String source) =>
      TotalModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TotalModel(totalIn: $totalIn, totalOut: $totalOut, month: $month)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TotalModel &&
        other.totalIn == totalIn &&
        other.totalOut == totalOut &&
        other.month == month;
  }

  @override
  int get hashCode => totalIn.hashCode ^ totalOut.hashCode ^ month.hashCode;
}
