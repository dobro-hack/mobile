import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifitionAPI {
  static final _notif = FlutterLocalNotificationsPlugin();

  static Future _notifDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
      "channelId", "channelName",
      channelDescription: 'channelDescription',
      icon: '@mipmap/ic_launcher',
      importance: Importance.max,
      // styleInformation: styleInformation,
    ));
  }

  static Future init({bool initSch = false}) async {
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      notificationCategories: [
        DarwinNotificationCategory(
          'demoCategory',
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain('id_1', 'Action 1'),
            DarwinNotificationAction.plain(
              'id_2',
              'Action 2',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
            DarwinNotificationAction.plain(
              'id_3',
              'Action 3',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        )
      ],
    );
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin);
    await _notif.initialize(
      settings,
    );
  }

  static Future showNatifition({
    int id = 0,
    String? title,
    String? body,
    String? showedText,
  }) async =>
      _notif.show(
        id,
        title,
        body,
        await _notifDetails(),
        payload: showedText,
      );
}
