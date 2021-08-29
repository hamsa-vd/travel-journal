import 'package:flutter/material.dart';
import 'package:travel_journal/journal.dart';
import 'package:travel_journal/constants.dart';
import 'package:travel_journal/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/journal':
        if (args is Journal)
          return MaterialPageRoute(builder: (_) => JournalPage(journal: args));
        else
          return MaterialPageRoute(builder: (_) => _ErrorPage());
      default:
        return MaterialPageRoute(builder: (_) => _ErrorPage());
    }
  }
}

class _ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error Page"),
      ),
      body: Center(
        child: Text("Reached Wrong Place, Please go back"),
      ),
    );
  }
}
