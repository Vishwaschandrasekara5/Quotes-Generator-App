import 'package:flutter/material.dart';

class Quote {
  String text;
  String author;
  String details;
  String category;
  String imageUrl; // Added imageUrl to store the author's image URL

  Quote({
    required this.text,
    required this.author,
    required this.details,
    required this.category,
    required this.imageUrl, // Constructor now takes imageUrl as a parameter
  });
}

class QuoteDetailsScreen extends StatelessWidget {
  final Quote quote;

  const QuoteDetailsScreen({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Details'),
        backgroundColor: Colors.orange,
      ),
      body: Center( // Center the entire content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              // Displaying the network image of the author
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(quote.imageUrl), // Loading the image from the network
                onBackgroundImageError: (error, stackTrace) {
                  // In case of error, show a placeholder image
                  // You can handle the error here, but you cannot return a widget
                },
              ),
              const SizedBox(height: 20),
              Text(
                '"${quote.text}"',
                style: const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Author: ${quote.author}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Details: ${quote.details}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
