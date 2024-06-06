import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/MainPage/detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  



@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
             Row(
                children: [
                  Padding(padding: EdgeInsets.only(top: 25,left: 25),
                  child: SizedBox(
                      width: 60, // Atur lebar yang Anda inginkan di sini
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40), // Sesuaikan dengan radius yang Anda inginkan
                        child: Image.asset('images/Elon.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 270),
                  Padding(padding: EdgeInsets.only(top: 28),
                    child: Icon(
                    CupertinoIcons.bell_solid,
                    color: Color.fromARGB(255, 82, 137, 215),
                    size: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
                SizedBox(
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
                          controller: _controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Color.fromARGB(182, 27, 27, 27),fontWeight: FontWeight.w800),
                          ),
                          onChanged: (value) {
                            // Implement your search logic here
                            print('Search Query: $value');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 65),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Most Read',
                    style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                            padding: EdgeInsets.only(left: 232),
                            child: TextButton(
                              onPressed: () {
                                // Aksi yang dilakukan saat tombol ditekan
                                print('view type pressed');
                                // Pemanggilan fungsi untuk navigasi ke scene lain
                                Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
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
                          child: Text(
                          'View All',
                          style: TextStyle(color: Color.fromARGB(255, 45, 118, 220),fontSize: 17,fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:  Row(
                    children: [
                      Padding(
                    padding: EdgeInsets.only(left: 15),
                    child:
                     GestureDetector(
                      onTap: () {
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
                        child: Column(
                          children: [
                            SizedBox(
                              width: 115, // Atur lebar yang Anda inginkan di sini
                              height: 165,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15), // Sesuaikan dengan radius yang Anda inginkan
                                child: Image.asset('images/erere.jpeg'),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Center(
                                child: Text(
                                  'Laskar Pelangi',
                                  style: TextStyle(fontSize: 15, color: const Color.fromARGB(255, 21, 21, 21), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      SizedBox(
                      width: 120, // Atur lebar yang Anda inginkan di sini
                      height: 165,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1), // Sesuaikan dengan radius yang Anda inginkan
                        child: Image.asset('images/dilan.jpg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                        'Dilan 1990',
                        style: TextStyle(fontSize: 15,color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      SizedBox(
                      width: 120, // Atur lebar yang Anda inginkan di sini
                      height: 165,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Sesuaikan dengan radius yang Anda inginkan
                        child: Image.asset('images/conan.jpeg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                        'D.Conan',
                        style: TextStyle(fontSize: 15,color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      SizedBox(
                      width: 120, // Atur lebar yang Anda inginkan di sini
                      height: 165,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Sesuaikan dengan radius yang Anda inginkan
                        child: Image.asset('images/erere.jpeg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                        'Laskar Pelangi',
                        style: TextStyle(fontSize: 15,color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                    ),
                  ],
                ),
               ),
               SizedBox(height: 50),
                Padding(padding: EdgeInsets.only(right: 320),
                  child: Text(
                    'Category',
                    style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: 20),
                 Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15),
                    child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                          width: 85,
                          height: 50,
                          color: Color.fromARGB(235, 213, 105, 32),
                          child: Center(
                            child: Text(
                              'Fiksi',
                              style: TextStyle(fontWeight: FontWeight.w700,color: Color.fromARGB(255, 255, 255, 255),fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                     Padding(padding: EdgeInsets.only(left: 15),
                    child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                          width: 110,
                          height: 50,
                          color: Color.fromARGB(235, 45, 163, 199),
                          child: Center(
                            child: Text(
                              'Biografi',
                              style: TextStyle(fontWeight: FontWeight.w700,color: Color.fromARGB(255, 255, 255, 255),fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15),
                    child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                          width: 108,
                          height: 50,
                          color: Color.fromARGB(235, 67, 213, 98),
                          child: Center(
                            child: Text(
                              'History',
                              style: TextStyle(fontWeight: FontWeight.w700,color: Color.fromARGB(255, 255, 255, 255),fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                 ),
                 SizedBox(height: 50),
                Padding(padding: EdgeInsets.only(right: 317),
                  child: Text(
                    'All Books',
                    style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child: GestureDetector(
                          onTap: () {
                            // Ganti scene atau lakukan navigasi ke halaman lain di sini
                            // Contoh:
                            Navigator.push(
                                    context,
                                     PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => DetailPage(),
                                       transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var curve = Curves.easeInOut;

                                        var tween = Tween(begin: 0.0, end: 1.5).chain(CurveTween(curve: curve));

                                          return FadeTransition(
                                            opacity: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                   );
                          },
                          child: Container(
                            color: Colors.transparent, // Warna latar belakang container utama
                            width: 400,
                            height: 110,
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 110,
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    'images/erere.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 118),
                                      child: Text(
                                        'Laskar Pelangi',
                                        style: TextStyle(
                                          color: const Color.fromARGB(255, 21, 21, 21),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: EdgeInsets.only(right: 160),
                                      child: Text(
                                        'Genre: Fiksi',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 21, 21, 21),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: EdgeInsets.only(right: 100),
                                      child: Text(
                                        'Author: Andrea Hirata',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 21, 21, 21),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Text(
                                            'Rating:',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(255, 21, 21, 21),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 175),
                                          child: Icon(
                                            Icons.star,
                                            color: const Color.fromARGB(255, 250, 175, 63),
                                          ),
                                        ),
                                        Text(
                                          '4.7',
                                          style: TextStyle(
                                            color: const Color.fromARGB(255, 21, 21, 21),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                     ),  
                     SizedBox(height: 10),
                     Divider( // Garis pemisah
                        color: const Color.fromARGB(255, 131, 131, 131),
                        height: 20, // Tinggi garis
                        thickness: 2, // Ketebalan garis
                        indent: 20, // Padding kiri
                        endIndent: 20, // Padding kanan
                      ), 
                       SizedBox(height: 10),
                      Padding(padding: EdgeInsets.only(left: 5),
                      child: Container(
                        color: Colors.transparent, // Warna latar belakang container utama
                        width: 400,
                        height: 110,     
                        child:Row(
                          children: [
                           Container(
                              width: 90,
                              height: 110,
                              color: Colors.transparent,
                              child: Image.asset(
                        'images/conan.jpeg',
                        fit: BoxFit.cover,
                          ),
                            ),
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(right: 190),
                                 child: Text('D.Conan',
                                  style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.bold,fontSize: 17),
                                 ),
                                ),
                                SizedBox(height: 5),
                                Padding(padding: EdgeInsets.only(right: 140),
                                  child: Text('Genre: Biografi',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                  ),
                                ),  
                                SizedBox(height: 5),
                                Padding(padding: EdgeInsets.only(right: 95),
                                  child: Text('Author: Ginatri S. Noer',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                  ),
                                ),
                                SizedBox(height: 5),
                               Row(
                                children: [
                                   Padding(padding: EdgeInsets.only(left: 30),
                                  child: Text('Rating:',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 175),
                                  child: Icon(Icons.star,color: const Color.fromARGB(255, 250, 175, 63),
                                    ),
                                  ),
                                  Text('4.9',
                                  style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.w600),
                                  ),
                                ],
                               ),
                              ],
                            ),
                           ],
                         ),
                       ),
                     ),  
                     SizedBox(height: 10),
                     Divider( // Garis pemisah
                        color: const Color.fromARGB(255, 131, 131, 131),
                        height: 20, // Tinggi garis
                        thickness: 2, // Ketebalan garis
                        indent: 20, // Padding kiri
                        endIndent: 20, // Padding kanan
                      ), 
                       SizedBox(height: 10),
                      Padding(padding: EdgeInsets.only(left: 5),
                      child: Container(
                        color: Colors.transparent, // Warna latar belakang container utama
                        width: 400,
                        height: 110,     
                        child:Row(
                          children: [
                           Container(
                              width: 90,
                              height: 110,
                              color: Colors.transparent,
                              child: Image.asset(
                        'images/dilan.jpg',
                        fit: BoxFit.cover,
                          ),
                            ),
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(right: 125),
                                 child: Text('Dilan 1990',
                                  style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.bold,fontSize: 17),
                                 ),
                                ),
                                SizedBox(height: 5),
                                Padding(padding: EdgeInsets.only(right: 145),
                                  child: Text('Genre: History',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                  ),
                                ),  
                                SizedBox(height: 5),
                                Padding(padding: EdgeInsets.only(right: 130),
                                  child: Text('Author: Marco K.',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                  ),
                                ),
                                SizedBox(height: 5),
                               Row(
                                children: [
                                   Padding(padding: EdgeInsets.only(left: 30),
                                  child: Text('Rating:',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 175),
                                  child: Icon(Icons.star,color: const Color.fromARGB(255, 250, 175, 63),
                                    ),
                                  ),
                                  Text('4.7',
                                  style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.w600),
                                  ),
                                ],
                               ),
                              ],
                            ),
                           ],
                         ),
                       ),
                     ),  
                       SizedBox(height: 10),
                     Divider( // Garis pemisah
                        color: const Color.fromARGB(255, 131, 131, 131),
                        height: 20, // Tinggi garis
                        thickness: 2, // Ketebalan garis
                        indent: 20, // Padding kiri
                        endIndent: 20, // Padding kanan
                      ), 
                       SizedBox(height: 10),
                      Padding(padding: EdgeInsets.only(left: 5),
                      child: Container(
                        color: Colors.transparent, // Warna latar belakang container utama
                        width: 400,
                        height: 110,     
                        child:Row(
                          children: [
                           Container(
                              width: 90,
                              height: 110,
                              color: Colors.transparent,
                              child: Image.asset(
                        'images/erere.jpeg',
                        fit: BoxFit.cover,
                          ),
                            ),
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(right: 118),
                                 child: Text('Laskar Pelangi',
                                  style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.bold,fontSize: 17),
                                 ),
                                ),
                                SizedBox(height: 5),
                                Padding(padding: EdgeInsets.only(right: 160),
                                  child: Text('Genre: Fiksi',
                                style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                  ),
                                ),  
                                SizedBox(height: 5),
                                Padding(padding: EdgeInsets.only(right: 100),
                                  child: Text('Author: Andrea Hirata',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                  ),
                                ),
                                SizedBox(height: 5),
                               Row(
                                children: [
                                   Padding(padding: EdgeInsets.only(left: 30),
                                  child: Text('Rating:',
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 21, 21, 21)),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 175),
                                  child: Icon(Icons.star,color: const Color.fromARGB(255, 250, 175, 63),
                                    ),
                                  ),
                                  Text('4.7',
                                  style: TextStyle(color: const Color.fromARGB(255, 21, 21, 21),fontWeight: FontWeight.w600),
                                  ),
                                ],
                               ),
                              ],
                            ),
                           ],
                         ),
                       ),
                     ),
SizedBox(height: 20),
                    ],
                  ),
              ],
            ),
          ), 
        ),
    );
  }
}
