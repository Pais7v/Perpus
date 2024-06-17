import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String genre;
  final String imageAsset;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.imageAsset,
  });
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Book> _books = [
    Book(
      title: 'Laskar Pelangi',
      author: 'Andrea Hirata',
      genre: 'Fiksi',
      imageAsset: 'images/erere.jpeg',
    ),
    Book(
      title: 'Dilan 1990',
      author: 'Pidi Baiq',
      genre: 'Fiksi',
      imageAsset: 'images/dilan.jpg',
    ),
    Book(
      title: 'D.conan',
      author: 'Gosho Aoyama',
      genre: 'Biografi',
      imageAsset: 'images/conan.jpeg',
    ),
  ];

  List<Book> _filteredBooks = []; // List to hold filtered books
  String _searchTerm = ''; // Search term entered by the user

  @override
  void initState() {
    super.initState();
    _filteredBooks = _books; // Initialize with all books
  }

  void _filterBooks(String query) {
    setState(() {
      _searchTerm = query;
      if (_searchTerm.isEmpty) {
        _filteredBooks = _books; // Reset to all books if query is empty
      } else {
        _filteredBooks = _books.where((book) =>
            book.title.toLowerCase().contains(_searchTerm.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Search'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 360,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 219, 219, 219),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 82, 137, 215),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(182, 27, 27, 27),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onChanged: (value) {
                          _filterBooks(value); // Call filtering function on input change
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredBooks.length,
              itemBuilder: (context, index) {
                return BookCard(book: _filteredBooks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(book.imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Author: ${book.author}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Genre: ${book.genre}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.9',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
