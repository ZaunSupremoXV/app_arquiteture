import 'dart:convert';

class ApiadvisorModel {
  String country;
  String date;
  String text;

  ApiadvisorModel(
      {required this.country, required this.date, required this.text});

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'date': date,
      'text': text,
    };
  }

  factory ApiadvisorModel.fromMap(Map<String, dynamic> map) {
    return ApiadvisorModel(
      country: map['country'],
      date: map['date'],
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiadvisorModel.fromJson(String source) =>
      ApiadvisorModel.fromMap(json.decode(source));
}
