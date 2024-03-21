import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabsScreen(),
      theme: theme,
    );
  }
}
