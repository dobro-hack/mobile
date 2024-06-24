import 'dart:developer';

import 'package:eco/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/app.dart';
import 'features/base/data/base_repository.dart';
import 'features/base/data/local_notification_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  FirebaseMessaging.instance.requestPermission(provisional: true);

  final fbToken = await FirebaseMessaging.instance.getToken();
  if (fbToken != null) {
    log(fbToken.toString());
    BaseRepository().sendFBToken(fbToken);
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      NotifitionAPI.showNatifition(
          title: message.notification!.title, body: message.notification!.body);
    }
  });

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
