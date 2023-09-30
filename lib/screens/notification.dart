import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:ecommerce_app1/models/notification_model.dart';
import '../constants/images.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  String timeAgoSinceDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    final recentNotifications = notifications
        .where((notification) => notification.dateTime.isAfter(yesterday))
        .toList();

    final yesterdayNotifications = notifications
        .where((notification) =>
            notification.dateTime.isBefore(yesterday) &&
            notification.dateTime
                .isAfter(yesterday.subtract(const Duration(days: 1))))
        .toList();

    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Notifications'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recentNotifications.isNotEmpty)
                _buildNotificationSection('Recent', recentNotifications),
              if (yesterdayNotifications.isNotEmpty)
                _buildNotificationSection(
                    'Yesterday', yesterdayNotifications.reversed.toList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSection(
    String sectionTitle,
    List<NotificationModel> notifications,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            final textColor = notification.read
                ? AppColors.secondaryColor
                : AppColors.primaryColor;
            final elevation = notification.read ? 0.0 : 4.0;
            final reverseelevation = notification.read ? 4.0 : 0.0;
            final color = notification.read ? Colors.transparent : Colors.white;
            return Slidable(
              actionPane: const SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              secondaryActions: [
                IconSlideAction(
                  color: Colors.red,
                  icon: Icons.delete_outlined,
                  onTap: () {
                    notifications.removeAt(index);
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                ),
              ],
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  color: color,
                  elevation: elevation,
                  child: Padding(
                    padding: paddingall10,
                    child: Row(
                      children: [
                        Card(
                          elevation: reverseelevation,
                          child: Expanded(
                            flex: 1,
                            child: Image.asset(
                              Images.logo,
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.notification,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: textColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '\$${notification.price}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          timeAgoSinceDate(notification.dateTime),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
