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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
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
                    image: AssetImage('images/erere.jpeg'),
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
                          image: AssetImage('images/erere.jpeg'),
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
                          ' Dirilis pada tahun 2005 oleh penerbit Bentang Pustaka, novel ini bahkan telah melalang buana hingga ke kancah internasional. Buktinya, novel ini telah diterjemahkan ke dalam 40 bahasa asing, terbit dalam 22 bahasa, dan telah beredar di lebih dari 130 negara. Novel yang terinspirasi dari kisah nyata kehidupan Andrea Hirata ini, juga telah berhasil meraih beberapa penghargaan. Salah satunya adalah novel ”Laskar Pelangi” edisi Amerika berhasil keluar sebagai pemenang pertama New York Book Festival 2013 kategori General Fiction. Tidak hanya itu saja, novel ini juga berhasil meraih peringkat pertama Buchawards 2013 untuk edisi Jewrman-nya yang berjudul Die Regenbogen Truppe Karena kisahnya yang inpiratif, novel “Laskar Pelangi” telah banyak diadaptasi ke dalam berbagai bentuk seperti layar lebar, drama musikal, serial televisi, lagu, dan bahkan koreografi oleh Citydance Company di Washington D.C. Film adaptasi-nya yang disutradarai oleh Riri Riza, juga ditayangkan di Smithsonian dan Berlinale (The Berlin Innternational Film Festival).',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                            child: Padding(padding: EdgeInsets.only(left: 60),
                            child: ElevatedButton(
                                onPressed: () {
                                  // Lakukan aksi saat tombol ditekan
                                  print('Tombol Submit Ditekan');
                                  
                                  // Contoh penggunaan Navigator.push untuk berpindah ke halaman baru
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
                                        "Pinjam",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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