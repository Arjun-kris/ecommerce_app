import 'package:ecommerce_app1/constants/colors.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title:
            const Text('Notifications', style: TextStyle(color: Colors.black)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
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
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Images.logo,
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              notification.notification,
                              style: TextStyle(
                                fontSize: 12,
                                color: textColor,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                timeAgoSinceDate(notification.dateTime),
                                style: const TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
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
