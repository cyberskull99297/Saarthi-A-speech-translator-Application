import 'package:ai_asistant/screens/signin_screen.dart';
import 'package:ai_asistant/screens/homePagescreen.dart';
import 'package:ai_asistant/utils/pallete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saarthi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.white, centerTitle: true),
        // primarySwatch: Pallete.borderColor,
      ),
      home: HomePage(),
    );
  }
}
