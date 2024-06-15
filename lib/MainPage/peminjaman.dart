import 'package:flutter/material.dart';
import 'package:flutter_application/MainPage/detail.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                        // Handle book return
                      },
                      child: Text('Pengembalian Buku'),
                    ),
                  ),
                  SizedBox(height: 16),
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
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _submitReview,
                          child: Text('Submit Review'),
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
                        ..._reviews.map((review) {
                          return Card(
                            elevation: 4.0,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
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
                                  SizedBox(height: 8),
                                  Text(
                                    review['review']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
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

void main() {
  runApp(MaterialApp(
    title: 'Halaman Peminjaman Buku',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Peminjaman(),
  ));
}
