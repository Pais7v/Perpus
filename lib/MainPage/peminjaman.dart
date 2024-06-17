import 'package:flutter/material.dart';
import 'package:flutter_application/MainPage/detail.dart';
import 'package:flutter_application/MainPage/settings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Peminjaman extends StatefulWidget {
  @override
  _PeminjamanState createState() => _PeminjamanState();
}

class _PeminjamanState extends State<Peminjaman> {
  double _currentRating = 0.0;
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, String>> _reviews = [];

  void _submitReview() {
    if (_reviewController.text.isNotEmpty) {
      setState(() {
        _reviews.add({
          'rating': _currentRating.toString(),
          'review': _reviewController.text,
        });
        _currentRating = 0.0;
        _reviewController.clear();
      });
    }
  }

  void _deleteReview(int index) {
    setState(() {
      _reviews.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
          },
        ),
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Content with white background
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16.0, kToolbarHeight, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage('images/erere.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Laskar Pelangi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Card(
                    elevation: 4.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Judul Buku: Laskar Pelangi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pengarang: Andrea Hirata',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Deskripsi: Novel ini terinspirasi dari kisah nyata kehidupan Andrea Hirata, mengisahkan perjuangan anak-anak Belitung untuk meraih pendidikan dan mimpi-mimpi mereka.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Status Peminjaman: Tersedia',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                     Navigator.push(context,
                                     PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => PengembalianScreen(),
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
                      style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 82, 137, 215),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Atur radius sesuai kebutuhan Anda
                                  ),
                                ),
                                  child: SizedBox(
                                  width: 200, // Atur lebar sesuai kebutuhan Anda
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "Pengembalian Buku",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Rate this Book',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        RatingBar.builder(
                          initialRating: _currentRating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _currentRating = rating;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _reviewController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Write your review',
                          ),
                          maxLines: 3,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitReview,
                         style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 82, 137, 215),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Atur radius sesuai kebutuhan Anda
                                  ),
                                ),
                                child: SizedBox(
                                  width: 200, // Atur lebar sesuai kebutuhan Anda
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "Submit Review",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  if (_reviews.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reviews:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _reviews.length,
                          itemBuilder: (context, index) {
                            final review = _reviews[index];
                            return Card(
                              elevation: 4.0,
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Rating: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            RatingBarIndicator(
                                              rating: double.parse(review['rating']!),
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20.0,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            _deleteReview(index);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      review['review']!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
