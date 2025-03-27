import 'package:flutter/material.dart';
import 'package:gitproj/screens/news_screen.dart'; // Import the NewsScreen

void main() {
  runApp(FinancialNewsApp());
}

class FinancialNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Financial News Sentiment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsScreen(), // Set NewsScreen as the home screen
    );
  }
}
