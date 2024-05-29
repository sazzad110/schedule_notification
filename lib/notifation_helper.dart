import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() {
    _notification.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings()));
    tz.initializeTimeZones();
  }

  static scheduledNotifications(String title, String body, int minutes) async {
    var androidDetails = AndroidNotificationDetails(
      'important notification',
      'My channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosDetails = const DarwinNotificationDetails();
    var notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    for (int i = 1; i <= minutes; i++) {
      await _notification.zonedSchedule(
          i,
          title,
          body,
          tz.TZDateTime.now(tz.local).add(Duration(minutes: i)),
          notificationDetails,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          matchDateTimeComponents: DateTimeComponents.time);
    }
  }
}
