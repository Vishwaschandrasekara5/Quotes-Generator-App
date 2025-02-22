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
    // Motivational Quotes
    Quote(text: 'Be yourself; everyone else is already taken.', author: 'Oscar Wilde', details: 'Oscar Wilde was an Irish poet and playwright.', category: 'Motivational'),
    Quote(text: 'Do what you can, with what you have, where you are.', author: 'Theodore Roosevelt', details: 'Theodore Roosevelt was the 26th President of the United States.', category: 'Motivational'),
    Quote(text: 'The best way to predict the future is to create it.', author: 'Peter Drucker', details: 'Peter Drucker was an Austrian-American management consultant.', category: 'Motivational'),
    Quote(text: 'In the middle of difficulty lies opportunity.', author: 'Albert Einstein', details: 'Einstein was a theoretical physicist who developed the theory of relativity.', category: 'Motivational'),
    Quote(text: 'It always seems impossible until it’s done.', author: 'Nelson Mandela', details: 'Nelson Mandela was a South African anti-apartheid revolutionary.', category: 'Motivational'),
    Quote(text: 'You must be the change you wish to see in the world.', author: 'Mahatma Gandhi', details: 'Mahatma Gandhi was an Indian lawyer and anti-colonial nationalist.', category: 'Motivational'),

    // Inspirational Quotes
    Quote(text: 'In the middle of difficulty lies opportunity.', author: 'Albert Einstein', details: 'Einstein was a theoretical physicist who developed the theory of relativity.', category: 'Inspirational'),
    Quote(text: 'It always seems impossible until it’s done.', author: 'Nelson Mandela', details: 'Nelson Mandela was a South African anti-apartheid revolutionary.', category: 'Inspirational'),
    Quote(text: 'You must be the change you wish to see in the world.', author: 'Mahatma Gandhi', details: 'Mahatma Gandhi was an Indian lawyer and anti-colonial nationalist.', category: 'Inspirational'),
    Quote(text: 'Success is not final, failure is not fatal: It is the courage to continue that counts.', author: 'Winston Churchill', details: 'Winston Churchill was a British politician.', category: 'Inspirational'),
    Quote(text: 'The only way to do great work is to love what you do.', author: 'Steve Jobs', details: 'Steve Jobs was an American entrepreneur and co-founder of Apple Inc.', category: 'Inspirational'),
    Quote(text: 'Live as if you were to die tomorrow. Learn as if you were to live forever.', author: 'Mahatma Gandhi', details: 'Mahatma Gandhi was an Indian lawyer and anti-colonial nationalist.', category: 'Inspirational'),

    // Love Quotes
    Quote(text: 'Love is composed of a single soul inhabiting two bodies.', author: 'Aristotle', details: 'Aristotle was a Greek philosopher.', category: 'Love'),
    Quote(text: 'To love and be loved is to feel the sun from both sides.', author: 'David Viscott', details: 'David Viscott was an American psychiatrist and author.', category: 'Love'),
    Quote(text: 'Love is a friendship set to music.', author: 'Joseph Campbell', details: 'Joseph Campbell was an American professor and writer.', category: 'Love'),
    Quote(text: 'True love cannot be found where it does not exist, nor can it be denied where it does.', author: 'Torquato Tasso', details: 'Torquato Tasso was an Italian poet.', category: 'Love'),
    Quote(text: 'Love does not dominate; it cultivates.', author: 'Johann Wolfgang von Goethe', details: 'Johann Wolfgang von Goethe was a German writer.', category: 'Love'),
    Quote(text: 'Where there is love, there is life.', author: 'Mahatma Gandhi', details: 'Mahatma Gandhi was an Indian lawyer and anti-colonial nationalist.', category: 'Love'),

    // Wisdom Quotes
    Quote(text: 'The only true wisdom is in knowing you know nothing.', author: 'Socrates', details: 'Socrates was a Greek philosopher.', category: 'Wisdom'),
    Quote(text: 'Wisdom begins in wonder.', author: 'Socrates', details: 'Socrates was a Greek philosopher.', category: 'Wisdom'),
    Quote(text: 'Knowing others is intelligence; knowing yourself is true wisdom.', author: 'Lao Tzu', details: 'Lao Tzu was an ancient Chinese philosopher.', category: 'Wisdom'),
    Quote(text: 'The journey of a thousand miles begins with one step.', author: 'Lao Tzu', details: 'Lao Tzu was an ancient Chinese philosopher.', category: 'Wisdom'),
    Quote(text: 'A fool thinks himself to be wise, but a wise man knows himself to be a fool.', author: 'William Shakespeare', details: 'William Shakespeare was an English playwright and poet.', category: 'Wisdom'),
    Quote(text: 'The only source of knowledge is experience.', author: 'Albert Einstein', details: 'Albert Einstein was a theoretical physicist.', category: 'Wisdom'),

    // Humor Quotes
    Quote(text: 'I am not afraid of death, I just don’t want to be there when it happens.', author: 'Woody Allen', details: 'Woody Allen is an American director and comedian.', category: 'Humor'),
    Quote(text: 'Behind every great man is a woman rolling her eyes.', author: 'Jim Carrey', details: 'Jim Carrey is a Canadian-American comedian and actor.', category: 'Humor'),
    Quote(text: 'Two things are infinite: the universe and human stupidity; and I’m not sure about the universe.', author: 'Albert Einstein', details: 'Albert Einstein was a theoretical physicist.', category: 'Humor'),
    Quote(text: 'I used to think I was indecisive, but now I’m not too sure.', author: 'Unknown', details: 'Unknown', category: 'Humor'),
    Quote(text: 'I’m writing a book. I’ve got the page numbers done.', author: 'Steven Wright', details: 'Steven Wright is an American comedian and writer.', category: 'Humor'),
    Quote(text: 'The early bird might get the worm, but the second mouse gets the cheese.', author: 'Steven Wright', details: 'Steven Wright is an American comedian and writer.', category: 'Humor'),
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

  // Function to show the quote details in a dialog
  void showQuoteDetails(Quote quote) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(quote.text),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Author: ${quote.author}', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Details: ${quote.details}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['All', 'Motivational', 'Inspirational', 'Love', 'Wisdom', 'Humor'];

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => showQuoteDetails(currentQuote), // Show details on tap
                  child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    child: Card(
                      elevation: 4,
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox(
                        width: 400,
                        height: 550,
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
                ),
                const SizedBox(height: 10),
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
