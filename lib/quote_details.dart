import 'package:flutter/material.dart';

// Quote model class to store quote details
class Quote {
  String text;
  String author;
  String details;
  String category;
  String imageUrl;

  Quote({
    required this.text,
    required this.author,
    required this.details,
    required this.category,
    required this.imageUrl,
  });
}

// Quote details screen to display individual quote information
class QuoteDetailsScreen extends StatelessWidget {
  final Quote quote;

  const QuoteDetailsScreen({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Details'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false, // Removes the default back button
      ),
      body: Container(
        color: const Color.fromARGB(255, 31, 29, 29), // Background color set to dark theme
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Displays quote image
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(quote.imageUrl),
                        onBackgroundImageError: (error, stackTrace) {},
                      ),
                      const SizedBox(height: 20),
                      // Displays quote text
                      Text(
                        '"${quote.text}"',
                        style: const TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          color: Colors.white, // White text for readability
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      // Displays author name
                      Text(
                        'Author: ${quote.author}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      // Displays additional details about the author
                      Text(
                        'Details: ${quote.details}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Back button to return to the previous screen
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Adds spacing at the bottom
              child: SizedBox(
                width: 200, // Fixed button width
                height: 50, // Fixed button height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded edges
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
