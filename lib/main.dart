import 'package:authentication/screens/data.dart';
import 'package:authentication/screens/home.dart';
import 'package:authentication/screens/login.dart';
import 'package:authentication/screens/register.dart';
import 'package:authentication/service/auth.dart';
import 'package:authentication/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Auth example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/data',
          routes: {
            '/': (context) => Wrapper(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/data': (context) => DataScreen(app: app),
          },
        ));
  }
}
