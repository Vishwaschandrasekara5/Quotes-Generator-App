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
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVkQH8jp7MrO9GlanMjVzXUrexSVJqYC8K9Q&s',
    ),
    Quote(
      text: 'Do what you can, with what you have, where you are.',
      author: 'Theodore Roosevelt',
      details:
          'Theodore Roosevelt was the 26th President of the United States.',
      category: 'Motivational',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSluHBVZPS2-zwruzr_Jvte5iHHJGMYH2a9Sw&s',
    ),
    Quote(
      text: 'In the middle of difficulty lies opportunity.',
      author: 'Albert Einstein',
      details:
          'Einstein was a theoretical physicist who developed the theory of relativity.',
      category: 'Inspirational',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbwB8-VBOacbJPwYTG7xflxLZKdhwW319DYQ&s',
    ),
    Quote(
      text: 'It does not matter how slowly you go as long as you do not stop.',
      author: 'Confucius',
      details: 'Confucius was a Chinese philosopher and politician.',
      category: 'Inspirational',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2eODqB-GBtIbpUVMk8JJ7ZY_22bLQqqZ2w&s',
    ),
    Quote(
      text: 'The best way to predict the future is to create it.',
      author: 'Peter Drucker',
      details: 'Peter Drucker was an Austrian-American management consultant.',
      category: 'Success',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiTF2Sg1t6V_YzUplvzlMbZtuR_JhN5HeJGQ&s',
    ),
    Quote(
      text: 'Opportunities don’t happen, you create them.',
      author: 'Chris Grosser',
      details: 'Chris Grosser is a business strategist.',
      category: 'Success',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVxq1v-g2tQT6mhoMc3HTHTgx9C1j4fmZ4xw&s',
    ),
    Quote(
      text: 'Happiness depends upon ourselves.',
      author: 'Aristotle',
      details: 'Aristotle was a Greek philosopher and polymath.',
      category: 'Happiness',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrwBg2C8IagKcnyG47fq4autjt3jy2mT94Ug&s',
    ),
    Quote(
      text:
          'Happiness is not something ready-made. It comes from your own actions.',
      author: 'Dalai Lama',
      details: 'Dalai Lama is a spiritual leader of Tibet.',
      category: 'Happiness',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpf_-IEj4dlMtUzAWZtNsXJEq4Zb66-iqocg&s',
    ),
    Quote(
      text: 'A healthy outside starts from the inside.',
      author: 'Robert Urich',
      details: 'Robert Urich was an American film actor.',
      category: 'Health',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaYZ_v7DZM0sfer3CGJOLymwhG-fbDhxgdhA&s',
    ),
    Quote(
      text: 'Take care of your body. It’s the only place you have to live.',
      author: 'Jim Rohn',
      details:
          'Jim Rohn was an American entrepreneur and motivational speaker.',
      category: 'Health',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyakwmvR_eqbneOkMGsBfTM5zUubUArRhP4Q&s',
    ),
  ];

  late Quote currentQuote;
  String selectedCategory = "All";
  final List<String> categories = [
    "All",
    "Motivational",
    "Inspirational",
    "Success",
    "Happiness",
    "Health"
  ];

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
                child: Text(category,
                    style: const TextStyle(color: Colors.orange)),
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
                  onTap: () => navigateToQuoteDetails(currentQuote),
                  child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    child: Card(
                      elevation: 4,
                      color: const Color.fromARGB(255, 31, 29, 29).withOpacity(0.5),
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
                                  fontSize: 28, // Increased font size
                                  fontWeight: FontWeight.bold, // Bold text
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
                  width: 300,
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
                    child:
                        const Text('New Quote', style: TextStyle(fontSize: 18)),
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
