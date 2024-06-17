import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookMark extends StatefulWidget {
  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  bool _isBookmarked = false;
  double _rating = 0.0;
  TextEditingController _reviewController = TextEditingController();
  List<Map<String, dynamic>> _reviews = [];

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                size: 27.0,
                color: Colors.blue,
              ),
              onPressed: _toggleBookmark,
            ),
            SizedBox(height: 16.0), // Space between icon and rating/review
            Padding(
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
                    initialRating: _rating,
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
                    'Review:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _reviewController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your review',
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Save rating and review here
                        String review = _reviewController.text;
                        if (review.isNotEmpty) {
                          setState(() {
                            _reviews.add({'rating': _rating, 'review': review});
                            _reviewController.clear();
                            _rating = 0.0; // Reset rating after adding review
                          });
                        }
                      },
                      child: Text('Submit'),
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
                          subtitle: Text(
                            item['review'],
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
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
          ],
        ),
      ),
    );
  }
}
