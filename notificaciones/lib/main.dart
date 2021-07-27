import 'package:flutter/material.dart';

import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';
import 'package:notificaciones/services/push_notifications_service.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await PushNotificationsService.initializeApp();

  runApp(MyApp());
}
 
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() { 
    super.initState();
    
    PushNotificationsService.messagesStream.listen( (message) {
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'   : ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen()
      },
      title: 'Material App',
    );
  }
}