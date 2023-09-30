class NotificationModel {
  final String notification;
  final DateTime dateTime;
  final bool read;
  final String? price;

  NotificationModel({
    required this.notification,
    required this.dateTime,
    this.read = false,
    this.price,
  });
}


List<NotificationModel> notifications = [
  NotificationModel(
    notification: 'Updated price',
    dateTime: DateTime(2023, 9, 26, 6, 15),
    price: '250'
  ),

  NotificationModel(
    notification: 'Price updated',
    dateTime: DateTime(2023, 9, 25, 2, 15),
    price: '240',
    read: true,
  ),
  NotificationModel(
    notification: 'Shop app updated the price of prduct is increased',
    dateTime: DateTime(2023, 9, 25, 1, 0),
    price: '250',
    read: true,
  ),
  NotificationModel(
    notification: 'New product added',
    dateTime: DateTime(2023, 9, 25, 1, 30),
    price: '250',
    read: true,
  ),
];
