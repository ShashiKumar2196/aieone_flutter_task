import 'dart:convert';

List<DataModel> dataFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
