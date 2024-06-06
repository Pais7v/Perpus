import 'package:flutter/material.dart';
import 'package:flutter_application/MainPage/detail.dart';

class Peminjaman extends StatelessWidget {
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
                        
                      },
                      child: Text('Pengembalian Buku'),
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

void main() {
  runApp(MaterialApp(
    title: 'Halaman Peminjaman Buku',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Peminjaman(),
  ));
}
