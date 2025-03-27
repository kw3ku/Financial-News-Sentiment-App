import 'package:flutter/material.dart';

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
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // Hardcoded sample data
  List<dynamic> newsArticles = [
    {
      'title': 'Stock Market Hits Record High',
      'source': {'name': 'Financial Times'},
    },
    {
      'title': 'Tech Companies Face Major Losses',
      'source': {'name': 'TechCrunch'},
    },
    {
      'title': 'Oil Prices Surge Amid Global Tensions',
      'source': {'name': 'Reuters'},
    },
    {
      'title': 'Gold Prices Exceeds Performance Expectations',
      'source': {'name': 'Bloomberg'},
    },
    {
      'title': 'Tesla Stock Prices Slips for the Third Consecutive Day',
      'source': {'name': 'CNBC'},
    },
  ];

  // Function to determine sentiment
  Map<String, dynamic> getSentiment(String title) {
    if (title.toLowerCase().contains('record high') ||
        title.toLowerCase().contains('gains') ||
        title.toLowerCase().contains('exceeds') ||
        title.toLowerCase().contains('surge')) {
      return {'icon': Icons.trending_up, 'color': Colors.green};
    } else if (title.toLowerCase().contains('losses') ||
        title.toLowerCase().contains('drop') ||
        title.toLowerCase().contains('slips') ||
        title.toLowerCase().contains('decline')) {
      return {'icon': Icons.trending_down, 'color': Colors.red};
    } else {
      return {'icon': Icons.trending_flat, 'color': Colors.grey};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial News Sentiment'),
        centerTitle: true,
      ),
      body: newsArticles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsArticles[index];
                final sentiment = getSentiment(article['title'] ?? '');

                return Card(
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
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
