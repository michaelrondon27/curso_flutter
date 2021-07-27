import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// SHA1: 68:5B:8F:63:90:A0:CA:67:71:48:B9:6C:7D:19:2D:C0:2C:06:71:34

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static String? token;

  static StreamController<String> _messageStream = new StreamController.broadcast();

  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler( RemoteMessage message ) async {
    _messageStream.add( message.data['product'] ?? 'No data' );
  }

  static Future _onMessageHandler( RemoteMessage message ) async {
    _messageStream.add( message.data['product'] ?? 'No data' );
  }

  static Future _onMessageOpenApp( RemoteMessage message ) async {
    _messageStream.add( message.data['product'] ?? 'No data' );
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );

    FirebaseMessaging.onMessage.listen( _onMessageHandler );

    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );
  }

  static closeStreams() {
    _messageStream.close();
  }
}
