import 'dart:convert';

class NotificationScheduledRequestModel {
  final int id;
  final String title;
  final String body;
  final String payload;
  final int hour;
  final int minute;

  NotificationScheduledRequestModel({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
    required this.hour,
    required this.minute,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'payload': payload,
      'hour': hour,
      'minute': minute,
    };
  }

  factory NotificationScheduledRequestModel.fromMap(Map<String, dynamic> map) {
    return NotificationScheduledRequestModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      payload: map['payload'],
      hour: map['hour'],
      minute: map['minute'],
    );
  }

  String toJson() => json.encode(toMap());
}
