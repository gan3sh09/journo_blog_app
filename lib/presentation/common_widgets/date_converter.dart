import 'package:flutter/material.dart';

class DateConverter extends StatelessWidget {
  final String dateTime;
  final TextStyle? style;

  const DateConverter({required this.dateTime, required this.style, super.key});

  String getRelativeTime() {
    final now = DateTime.now();
    final dateTimeParsed = DateTime.parse(dateTime);
    final difference = now.difference(dateTimeParsed);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months months ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years years ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getRelativeTime(),
      style: style,
    );
  }
}
