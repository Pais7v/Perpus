import 'package:flutter/material.dart';

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
      backgroundColor: Color.fromARGB(255, 83, 83, 83),
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
                    Icons.email,
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
                    color: Color.fromARGB(255, 103, 103, 103),
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
                            hintStyle: TextStyle(color: const Color.fromARGB(182, 255, 255, 255)),
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
                    style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),
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
                          style: TextStyle(color: Color.fromARGB(255, 82, 137, 215),fontSize: 17,fontWeight: FontWeight.w800),
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
                    Padding(padding: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      SizedBox(
                      width: 115, // Atur lebar yang Anda inginkan di sini
                      height: 165,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Sesuaikan dengan radius yang Anda inginkan
                        child: Image.asset('images/laskarPelangi.jpg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                        'Laskar Pelangi',
                        style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
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
                        child: Image.asset('images/laskarPelangi.jpg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                        'Laskar Pelangi',
                        style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
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
                        child: Image.asset('images/laskarPelangi.jpg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                        'Laskar Pelangi',
                        style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
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
                        child: Image.asset('images/laskarPelangi.jpg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                        'Laskar Pelangi',
                        style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
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
                Padding(padding: EdgeInsets.only(right: 321),
                  child: Text(
                    'Category',
                    style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),
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
                              style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 17),
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
                              style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 17),
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
                              style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                 ),
              ],
            ),
          ), 
        ),
        bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 20), // Sesuaikan dengan nilai padding yang Anda inginkan
        child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 82, 137, 215),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
            ),
        ),
      ),
    );
  }
}
