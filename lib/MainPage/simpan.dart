import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String genre;
  final String imageAsset;
  bool isBookmarked; // Moved here to track individual book's bookmark status

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.imageAsset,
    this.isBookmarked = false, 
  });
}

class SavedBooks extends StatefulWidget {
  @override
  _SavedBooksState createState() => _SavedBooksState();
}

class _SavedBooksState extends State<SavedBooks> {
  final List<Book> books = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        title: Text('Saved Books'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookCard(book: books[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatefulWidget {
  final Book book;

  BookCard({required this.book});

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool _isBookmarked = false; // Local state for the bookmark button

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
      widget.book.isBookmarked = _isBookmarked; // Update the book's bookmark status
    });
  }

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.book.isBookmarked; // Initialize with the book's bookmark status
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 140,
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
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.book.imageAsset),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.book.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isBookmarked
                                ? Icons.bookmark_border
                                : Icons.bookmark,
                            size: 27.0,
                            color: Colors.blue,
                          ),
                          onPressed: _toggleBookmark,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Author: ${widget.book.author}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Genre: ${widget.book.genre}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
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
