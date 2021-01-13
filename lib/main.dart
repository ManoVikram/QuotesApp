import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/homeScreen.dart';
import './models/quotesAPI.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contxt) => Quotes(),
      child: MaterialApp(
        title: "Quotes Den",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: QuotesDen(),
      ),
    );
  }
}

class QuotesDen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

void main() {
  runApp(MyApp());
}
