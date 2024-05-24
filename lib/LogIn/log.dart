import 'package:flutter/material.dart';
import 'package:flutter_application_agustobrut/Home.dart';
import 'package:flutter_application_agustobrut/LogIn/reg.dart';
import 'package:flutter_application_agustobrut/LogIn/forgot.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _userController.addListener(() {
      setState(() {}); // Rebuild to update the suffix icon
    });
    _passwordController.addListener(() {
      setState(() {}); // Rebuild to update the suffix icon
    });
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 101, 170, 227),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Text(
                  "LogIn",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                ),
                SizedBox(height: 100),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: _userController,
                              decoration: InputDecoration(
                                hintText: 'Enter User',
                                hintStyle: TextStyle(color: Color.fromARGB(98, 0, 0, 0)),
                                labelText: 'User',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fillColor: const Color.fromARGB(147, 245, 245, 245),
                                filled: true,
                                suffixIcon: _userController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          _userController.clear();
                                        },
                                        icon: const Icon(Icons.clear),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(color: Color.fromARGB(98, 0, 0, 0)),
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fillColor: Color.fromARGB(147, 245, 245, 245),
                                filled: true,
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible = !_isPasswordVisible;
                                        });
                                      },
                                      icon: Icon(
                                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                      ),
                                    ),
                                    if (_passwordController.text.isNotEmpty)
                                      IconButton(
                                        onPressed: () {
                                          _passwordController.clear();
                                        },
                                        icon: const Icon(Icons.clear),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          ),
                          SizedBox(height: 2),
                          Padding(
                            padding: EdgeInsets.only(left: 180),
                            child: TextButton(
                              onPressed: () {
                                // Aksi yang dilakukan saat tombol ditekan
                                print('reset password pressed');
                                // Pemanggilan fungsi untuk navigasi ke scene lain
                                Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => frgt(),
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
                                'Forgot your password?',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          SizedBox(
                            child: Padding(padding: EdgeInsets.only(left: 100),
                            child: ElevatedButton(
                                onPressed: () {
                                  // Lakukan aksi saat tombol ditekan
                                  print('Tombol Submit Ditekan');
                                  
                                  // Contoh penggunaan Navigator.push untuk berpindah ke halaman baru
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
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Atur radius sesuai kebutuhan Anda
                                  ),
                                ),
                                child: SizedBox(
                                  width: 100, // Atur lebar sesuai kebutuhan Anda
                                  
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
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
                    SizedBox(height: 10),
                   Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 127),
                        child:  Text(
                      'No have account?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ),
                      SizedBox(width: 4),
                        GestureDetector(
                        onTap: () {
                          // Navigasi ke scene lain dengan animasi
                          Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => Sgn(),
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
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 8, 65, 111),
                          ),
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
    );
  }
}


