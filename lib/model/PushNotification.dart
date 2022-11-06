class PushNotification {
  PushNotification({
    required this.title,
    required this.body,
    required this.data,
    required this.receiveDateTime,
  });

  String title;
  String body;
  Map<String, dynamic> data;
  DateTime receiveDateTime;

  PushNotification.fromJson(Map<String, Object?> json)
      : this(
          title: json['title'] as String? ?? '',
          body: json['body'] as String? ?? '',
          data: json['data'] as Map<String, dynamic>? ?? {},
          receiveDateTime: json['receive_date_time'] != null
              ? DateTime.fromMicrosecondsSinceEpoch(
                  json['receive_date_time'] as int)
              : DateTime.now(),
        );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'body': body,
      'data': data,
      'receive_date_time': receiveDateTime.microsecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return '{'
        'title: $title, '
        'body: $body, '
        'data: $data, '
        'receiveDateTime: $receiveDateTime'
        '}';
  }
}
