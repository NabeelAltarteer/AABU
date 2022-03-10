import 'package:alalbayet/ui/collegs.dart';
import 'package:alalbayet/ui/pdf_view.dart';
import 'package:alalbayet/ui/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlalBayet',
      theme: ThemeData(),
        initialRoute: "/welcome",
        routes: {
          "/welcome":(context)=>WelcomeScreen(),
          "/collegs":(context)=>CollegsScreen(),


        },

    );
  }
}
