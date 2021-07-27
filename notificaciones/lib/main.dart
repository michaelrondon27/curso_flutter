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
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() { 
    super.initState();
    
    PushNotificationsService.messagesStream.listen( (message) {
      navigatorKey.currentState?.pushNamed('message', arguments: message );

      final snackBar = SnackBar(content: Text( message ));

      messengerKey.currentState?.showSnackBar( snackBar );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      routes: {
        'home'   : ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen()
      },
      scaffoldMessengerKey: messengerKey,
      title: 'Material App',
    );
  }
}