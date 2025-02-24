import 'package:flutter/material.dart';
import 'quote_details.dart'; // Import the QuoteDetailsScreen

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<Quote> quotes = [
    Quote(
      text: 'Be yourself; everyone else is already taken.',
      author: 'Oscar Wilde',
      details: 'Oscar Wilde was an Irish poet and playwright.',
      category: 'Motivational',
      imageUrl: 'https://example.com/oscar-wilde.jpg', // Add the image URL for Oscar Wilde
    ),
    Quote(
      text: 'Do what you can, with what you have, where you are.',
      author: 'Theodore Roosevelt',
      details: 'Theodore Roosevelt was the 26th President of the United States.',
      category: 'Motivational',
      imageUrl: 'https://example.com/theodore-roosevelt.jpg', // Add the image URL for Theodore Roosevelt
    ),
    Quote(
      text: 'In the middle of difficulty lies opportunity.',
      author: 'Albert Einstein',
      details: 'Einstein was a theoretical physicist who developed the theory of relativity.',
      category: 'Inspirational',
      imageUrl: 'https://example.com/albert-einstein.jpg', // Add the image URL for Albert Einstein
    ),
    Quote(
      text: 'It does not matter how slowly you go as long as you do not stop.',
      author: 'Confucius',
      details: 'Confucius was a Chinese philosopher and politician.',
      category: 'Inspirational',
      imageUrl: 'https://example.com/confucius.jpg', // Add the image URL for Confucius
    ),
    Quote(
      text: 'The best way to predict the future is to create it.',
      author: 'Peter Drucker',
      details: 'Peter Drucker was an Austrian-American management consultant.',
      category: 'Success',
      imageUrl: 'https://example.com/peter-drucker.jpg', // Add the image URL for Peter Drucker
    ),
    Quote(
      text: 'Opportunities don’t happen, you create them.',
      author: 'Chris Grosser',
      details: 'Chris Grosser is a business strategist.',
      category: 'Success',
      imageUrl: 'https://example.com/chris-grosser.jpg', // Add the image URL for Chris Grosser
    ),
    Quote(
      text: 'Happiness depends upon ourselves.',
      author: 'Aristotle',
      details: 'Aristotle was a Greek philosopher and polymath.',
      category: 'Happiness',
      imageUrl: 'https://example.com/aristotle.jpg', // Add the image URL for Aristotle
    ),
    Quote(
      text: 'Happiness is not something ready-made. It comes from your own actions.',
      author: 'Dalai Lama',
      details: 'Dalai Lama is a spiritual leader of Tibet.',
      category: 'Happiness',
      imageUrl: 'data:image/jpeg;base64,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', // Add the image URL for Dalai Lama
    ),
    Quote(
      text: 'A healthy outside starts from the inside.',
      author: 'Robert Urich',
      details: 'Robert Urich was an American film actor.',
      category: 'Health',
      imageUrl: 'https://example.com/robert-urich.jpg', // Add the image URL for Robert Urich
    ),
    Quote(
      text: 'Take care of your body. It’s the only place you have to live.',
      author: 'Jim Rohn',
      details: 'Jim Rohn was an American entrepreneur and motivational speaker.',
      category: 'Health',
      imageUrl: 'https://example.com/jim-rohn.jpg', // Add the image URL for Jim Rohn
    ),
  ];

  late Quote currentQuote;
  String selectedCategory = "All";
  final List<String> categories = ["All", "Motivational", "Inspirational", "Success", "Happiness", "Health"];

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

  void navigateToQuoteDetails(Quote quote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuoteDetailsScreen(quote: quote),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          DropdownButton<String>(
            dropdownColor: Colors.black87,
            value: selectedCategory,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.orange),
            underline: Container(),
            onChanged: (String? newCategory) {
              if (newCategory != null) {
                setState(() {
                  selectedCategory = newCategory;
                  fetchRandomQuote();
                });
              }
            },
            items: categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category, style: const TextStyle(color: Colors.orange)),
              );
            }).toList(),
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
                  onTap: () => navigateToQuoteDetails(currentQuote), // Navigate to details on tap
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
