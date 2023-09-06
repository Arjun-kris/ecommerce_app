class NotificationModel {
  final String notification;
  final DateTime dateTime;
  final bool read;

  NotificationModel({
    required this.notification,
    required this.dateTime,
    this.read = false,
  });
}

List<NotificationModel> notifications = [
  NotificationModel(
    notification: 'Price updated',
    dateTime: DateTime(2023, 9, 6, 2, 15),
  ),
  NotificationModel(
    notification: 'Shop app requires an update',
    dateTime: DateTime(2023, 9, 5, 10, 0),
    read: true,
  ),
  NotificationModel(
    notification: 'New product added',
    dateTime: DateTime(2023, 9, 5, 14, 30),
    read: true,
  ),
];
