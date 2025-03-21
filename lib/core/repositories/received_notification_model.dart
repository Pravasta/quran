class ReceivedNotificationModel {
  final int? id;
  final String? title;
  final String? body;
  final String? payload;

  ReceivedNotificationModel({this.id, this.title, this.body, this.payload});

  factory ReceivedNotificationModel.fromMap(Map<String, dynamic> map) {
    return ReceivedNotificationModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      payload: map['payload'],
    );
  }
}
