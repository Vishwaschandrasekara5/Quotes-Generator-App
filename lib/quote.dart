import 'package:flutter/material.dart';

class Quote {
  String text;
  String author;
  String details;
  String category;

  Quote({required this.text, required this.author, required this.details, required this.category});
}

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<Quote> quotes = [
    Quote(text: 'Be yourself; everyone else is already taken.', author: 'Oscar Wilde', details: 'Oscar Wilde was an Irish poet and playwright.', category: 'Motivational'),
    Quote(text: 'Do what you can, with what you have, where you are.', author: 'Theodore Roosevelt', details: 'Theodore Roosevelt was the 26th President of the United States.', category: 'Motivational'),
    Quote(text: 'The best way to predict the future is to create it.', author: 'Peter Drucker', details: 'Peter Drucker was an Austrian-American management consultant.', category: 'Motivational'),
    Quote(text: 'In the middle of difficulty lies opportunity.', author: 'Albert Einstein', details: 'Einstein was a theoretical physicist who developed the theory of relativity.', category: 'Inspirational'),
    Quote(text: 'It always seems impossible until it’s done.', author: 'Nelson Mandela', details: 'Nelson Mandela was a South African anti-apartheid revolutionary.', category: 'Inspirational'),
    Quote(text: 'You must be the change you wish to see in the world.', author: 'Mahatma Gandhi', details: 'Mahatma Gandhi was an Indian lawyer and anti-colonial nationalist.', category: 'Inspirational'),
  ];

  late Quote currentQuote;
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    currentQuote = quotes.first;
  }

  void fetchRandomQuote() {
    List<Quote> filteredQuotes = selectedCategory == "All"
        ? quotes
        : quotes.where((quote) => quote.category == selectedCategory).toList();

    if (filteredQuotes.isNotEmpty) {
      setState(() {
        currentQuote = (filteredQuotes..shuffle()).first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = quotes.map((q) => q.category).toSet().toList();
    categories.insert(0, "All");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Quotes',
          style: TextStyle(color: Colors.orange),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.category, color: Colors.orange),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Select Category"),
                      content: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue ?? "All";
                            fetchRandomQuote();
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns the content to take up full space
              children: [
                // Margin added here
                Container(
                  margin: const EdgeInsets.only(top: 120), // Top margin added
                  child: Card(
                    elevation: 4,
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 400, // Set a fixed width for the card
                      height: 550, // Set a fixed height for the card
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '"${currentQuote.text}"',
                              style: const TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '- ${currentQuote.author}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Small space between card and button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: fetchRandomQuote,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('New Quote', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
