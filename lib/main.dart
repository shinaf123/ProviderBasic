import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/api_provider.dart';
import 'package:provider_test/home.dart';

void main() {
  runApp(
    //Provider Initialize in Main...........
    ChangeNotifierProvider(
    create: (_) => DataProvider(),
    child: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
