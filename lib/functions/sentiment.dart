import 'package:flutter/material.dart';

Map<String, dynamic> getSentiment(String title) {
  if (title.toLowerCase().contains('record high') ||
      title.toLowerCase().contains('rewarding') ||
      title.toLowerCase().contains('rises') ||
      title.toLowerCase().contains('Easing') ||
      title.toLowerCase().contains('surge')) {
    return {'icon': Icons.trending_up, 'color': Colors.green};
  } else if (title.toLowerCase().contains('losses') ||
      title.toLowerCase().contains('drop') ||
      title.toLowerCase().contains('tariffs') ||
      title.toLowerCase().contains('hit') ||
      title.toLowerCase().contains('war') ||
      title.toLowerCase().contains('decline')) {
    return {'icon': Icons.trending_down, 'color': Colors.red};
  } else {
    return {'icon': Icons.trending_flat, 'color': Colors.grey};
  }
}
