import 'package:flutter/material.dart';
import 'package:gitproj/functions/sentiment.dart';
import 'package:gitproj/screens/news_detailscreen.dart';

class NewsCard extends StatelessWidget {
  final Map<String, dynamic> article;

  const NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    final sentiment = getSentiment(article['title'] ?? '');

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(article: article),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article['title'] ?? 'No title',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                article['source']['name'] ?? 'Unknown source',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    sentiment['icon'],
                    color: sentiment['color'],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
