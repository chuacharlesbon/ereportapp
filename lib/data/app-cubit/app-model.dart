// To parse this JSON data, do
//
//     final appModel = appModelFromJson(jsonString);
// BY: https://app.quicktype.io/

import 'dart:convert';

AppModel appModelFromJson(String str) => AppModel.fromJson(json.decode(str));

String appModelToJson(AppModel data) => json.encode(data.toJson());

class AppModel {
    String? connection;

    AppModel({
        this.connection,
    });

    AppModel copyWith({
        String? connection,
    }) => 
        AppModel(
            connection: connection ?? this.connection,
        );

    factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
        connection: json["connection"],
    );

    Map<String, dynamic> toJson() => {
        "connection": connection,
    };
}
