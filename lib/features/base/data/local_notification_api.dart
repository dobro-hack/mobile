import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:html/parser.dart';

// String _parseHtmlString(String? htmlString) {
//   var document = parse(htmlString);
//   String parsedString = document.documentElement?.text ?? '';
//   return parsedString;
// }

class NotifitionAPI {
  static final _notif = FlutterLocalNotificationsPlugin();
  // static final onNotif = BehaviorSubject<NotificationResponse?>();

  static Future _notifDetails() async {
    // const largeIconPath = 'assets/images/univ.png';
    // const bigPicturePath = 'assets/images/nature.png';
    // const styleInformation = BigPictureStyleInformation(
    //     FilePathAndroidBitmap(bigPicturePath),
    //     largeIcon: FilePathAndroidBitmap(largeIconPath));
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
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
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
      // onDidReceiveNotificationResponse: (details) async {
      //   onNotif.add(details);
      // },
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
        body, // _parseHtmlString(body),
        await _notifDetails(),
        payload: showedText,
      );
}
