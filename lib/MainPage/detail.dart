import 'package:flutter/material.dart';
import 'dart:ui';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar:
          true, // panjang di bawah AppBar
      body: Stack(
        children: [
          // Background blur image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height /
                2, // sampai judul
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/laskarPelangi.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          // Blue background
          Positioned(
            top: MediaQuery.of(context).size.height /
                2.5, // hal set halaman
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255), // Warna background 
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, kToolbarHeight, 16.0,
                16.0), // jarak AppBar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  // posisi gambar 
                  child: Container(
                    height: 200, // Tinggi buku
                    width: 170, // Lebar buku
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage('images/laskarPelangi.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  // judul
                  child: Text(
                    'Laskar Pelangi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks
                    ),
                  ),
                ),
                SizedBox(height: 27), // Menambah jarak antara judul dan rating
                // Kotak rating dan keterangan halaman
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Posisikan rating 
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width:
                                16), // jarak judul dan rating
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(
                            width: 8), // jarak icon dan text
                        Text(
                          '4.5', // Rating 
                          style: TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.w800),
                        ),
                        SizedBox(width: 10),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 14), // Menambah jarak vertical dan horizontal
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(width: 1.8, color: Colors.white), // Contoh BorderSide pada sisi kiri
                              right: BorderSide(width: 1.8, color: Colors.white), // Contoh BorderSide pada sisi kanan
                            ),
                          ),
                          child: Text(
                            'Fiksi',
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(width: 14),
                        Text(' Andrea Hirata',
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                    height: 25), // jarak rating
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sinopsis',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold 
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold 
                        ),
                      ),
                    ],
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