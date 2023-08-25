class Notification {
  final String notification;

  Notification({
    required this.notification,
  });
}

final List<Notification> notification = [
  Notification(
    notification: 'Shop app require update',
  ),

  Notification(
    notification: 'New product added',
  ),

  Notification(
    notification: 'Price updated',
  ),
];