// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  String? status;
  dynamic message;
  List<Datum>? data;

  DataModel({
    this.status,
    this.message,
    this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? icon;
  bool? isActive;
  DateTime? dateCreated;
  DateTime? dateUpdated;

  Datum({
    this.id,
    this.name,
    this.icon,
    this.isActive,
    this.dateCreated,
    this.dateUpdated,
  });

  @override
  String toString() {   // f you want to see the actual properties and values of each Datum object, you should override the toString method in your Datum class or access its properties individually and print them.
    return 'Datum(id: $id, name: $name, icon: $icon, isActive: $isActive, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    isActive: json["is_active"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateUpdated: json["date_updated"] == null ? null : DateTime.parse(json["date_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "is_active": isActive,
    "date_created": dateCreated?.toIso8601String(),
    "date_updated": dateUpdated?.toIso8601String(),
  };
}
