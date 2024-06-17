import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/MainPage/detail.dart';
import 'package:flutter_application/MainPage/profile.dart';
import 'package:flutter_application/MainPage/simpan.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        _filteredBooks = _books
            .where((book) =>
                book.title.toLowerCase().contains(_searchTerm.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25, left: 25),
                    child: SizedBox(
                      width: 60, // Atur lebar yang Anda inginkan di sini
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
                                       transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var curve = Curves.easeInOut;

                                        var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

                                          return FadeTransition(
                                            opacity: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              40), // Sesuaikan dengan radius yang Anda inginkan
                          child: Image.asset('images/Elon.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 270),
                  Padding(
                    padding: EdgeInsets.only(top: 28),
                    child: InkWell(
                      onTap: () {
                        // Navigasi ke halaman lain
                        Navigator.push(
                          context,
                                     PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => SavedBooks(),
                                       transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var curve = Curves.easeInOut;

                                        var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

                                          return FadeTransition(
                                            opacity: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                        );
                      },
                      child: Icon(
                        CupertinoIcons.bookmark,
                        color: Color.fromARGB(255, 82, 137, 215),
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 232, 232),
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
                                color: Color.fromARGB(160, 27, 27, 27),
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
              SizedBox(height: 20),
               Padding(
                padding: EdgeInsets.only(right: 317),
                child: Text(
                  'All Books',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 21, 21, 21),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 300, // Define a specific height for the list view
                child: ListView.builder(
                  itemCount: _filteredBooks.length,
                  itemBuilder: (context, index) {
                    return BookCard(book: _filteredBooks[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Most Read',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 21, 21, 21),
                          fontSize: 17,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {
                        // Aksi yang dilakukan saat tombol ditekan
                        print('view type pressed');
                        // Pemanggilan fungsi untuk navigasi ke scene lain
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                HomePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var curve = Curves.easeInOut;

                              var tween = Tween(begin: 0.0, end: 1.0)
                                  .chain(CurveTween(curve: curve));

                              return FadeTransition(
                                opacity: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 118, 220),
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BookCardHorizontal(
                      title: 'Laskar Pelangi',
                      imageAsset: 'images/erere.jpeg',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                DetailPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var curve = Curves.easeInOut;

                              var tween = Tween(begin: 0.0, end: 1.0)
                                  .chain(CurveTween(curve: curve));

                              return FadeTransition(
                                opacity: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    BookCardHorizontal(
                      title: 'Dilan 1990',
                      imageAsset: 'images/dilan.jpg',
                    ),
                    BookCardHorizontal(
                      title: 'D.Conan',
                      imageAsset: 'images/conan.jpeg',
                    ),
                    BookCardHorizontal(
                      title: 'Laskar Pelangi',
                      imageAsset: 'images/erere.jpeg',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(right: 320),
                child: Text(
                  'Category',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 21, 21, 21),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CategoryCard(
                    title: 'Fiksi',
                    color: Color.fromARGB(235, 213, 105, 32),
                  ),
                  CategoryCard(
                    title: 'Biografi',
                    color: Color.fromARGB(235, 45, 163, 199),
                  ),
                  CategoryCard(
                    title: 'History',
                    color: Color.fromARGB(235, 67, 213, 98),
                  ),
                ],
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
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
  child: GestureDetector(
    onTap: () {
      // Navigasi ke halaman detail atau tujuan lainnya
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => DetailPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.easeInOut;
            var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    },
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
  ),
);

  }
}

class BookCardHorizontal extends StatelessWidget {
  final String title;
  final String imageAsset;
  final VoidCallback? onTap;

  BookCardHorizontal({required this.title, required this.imageAsset, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              width: 115,
              height: 165,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imageAsset),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 21, 21, 21),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;

  CategoryCard({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 85,
          height: 50,
          color: color,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
