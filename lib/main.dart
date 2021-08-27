import 'package:flutter/material.dart';
import 'package:travel_journal/RouteGenerator.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
