import 'dart:convert';

AppMessage appMessageFromJson(String str) =>
    AppMessage.fromJson(json.decode(str));

String appMessageToJson(AppMessage data) => json.encode(data.toJson());

//AppMessage Model

class AppMessage {
  AppMessage({
    this.origin,
    this.to,
    this.photo,
    this.content,
  });

  int? origin;
  int? to;
  String? photo;
  String? content;

  factory AppMessage.fromJson(Map<String, dynamic> json) => AppMessage(
        origin: json['origin'],
        to: json['to'],
        photo: json['photo'],
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'origin': origin,
        'to': to,
        'photo': photo,
        'content': content,
      };
}
