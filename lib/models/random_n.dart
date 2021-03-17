import 'dart:convert';

RandomN randomNFromJson(String str) => RandomN.fromJson(json.decode(str));

String randomNToJson(RandomN data) => json.encode(data.toJson());

class RandomN {
  RandomN({
    this.dateAndTime,
    this.randomNumber,
  });

  DateTime dateAndTime;
  int randomNumber;

  factory RandomN.fromJson(Map<String, dynamic> json) => RandomN(
        dateAndTime: DateTime.parse(json["DateAndTime"]),
        randomNumber: json["RandomNumber"],
      );

  Map<String, dynamic> toJson() => {
        "DateAndTime": dateAndTime.toIso8601String(),
        "RandomNumber": randomNumber,
      };
}
