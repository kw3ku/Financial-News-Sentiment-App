import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(FinancialNewsApp());
}

class FinancialNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<dynamic> newsArticles = [];
  // List<dynamic> newsArticles = [
  //   {
  //     'title': 'Stock Market Hits Record High',
  //     'source': {'name': 'Financial Times'},
  //   },
  //   {
  //     'title': 'Tech Companies Lead Market Gains',
  //     'source': {'name': 'TechCrunch'},
  //   },
  //   {
  //     'title': 'Oil Prices Surge Amid Global Tensions',
  //     'source': {'name': 'Reuters'},
  //   },
  // ];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=business&apiKey=9a3ae43be9fd41918efbfe81bd845afe'));
    if (response.statusCode == 200) {
      setState(() {
        newsArticles = json.decode(response.body)['articles'];
      });
    } else {
      throw Exception('Failed to load news');
    }
    ;
    //}
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
                              Icons.trending_up,
                              color: Colors.green,
                            ), // Placeholder for sentiment
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
