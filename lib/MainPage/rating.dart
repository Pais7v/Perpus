import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingUlasan extends StatefulWidget {
  @override
  _RatingUlasanState createState() => _RatingUlasanState();
}

class _RatingUlasanState extends State<RatingUlasan> {
  double _rating = 0.0;
  TextEditingController _reviewController = TextEditingController();
  List<Map<String, dynamic>> _reviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rating:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 0,
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
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Ulasan:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan ulasan Anda',
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simpan rating dan ulasan di sini
                  String review = _reviewController.text;
                  if (review.isNotEmpty) {
                    setState(() {
                      _reviews.add({'rating': _rating, 'review': review});
                      _reviewController.clear();
                      _rating = 0.0;
                    });
                  }
                },
                child: Text('Kirim'),
              ),
            ),
            SizedBox(height: 16),
           Expanded(
              child: ListView.builder(
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  final item = _reviews[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/Elon.jpg"), 
                    ),
                    title: Text('Rating: ${item['rating']}'),
                    subtitle: Text(item['review'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _reviews.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
