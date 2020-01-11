// To parse this JSON data, do
//
//     final tileModel = tileModelFromJson(jsonString);

import 'dart:convert';

List<TileModel> tileModelFromJson(String str) => List<TileModel>.from(json.decode(str).map((x) => TileModel.fromJson(x)));

String tileModelToJson(List<TileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TileModel {
    String name;
    String message;
    String time;
    String messageStatus;

    TileModel({
        this.name,
        this.message,
        this.time,
        this.messageStatus,
    });

    factory TileModel.fromJson(Map<String, dynamic> json) => TileModel(
        name: json["name"],
        message: json["message"],
        time: json["time"],
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "time": time,
        "messageStatus": messageStatus,
    };
}
