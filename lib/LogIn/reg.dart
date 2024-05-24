import 'package:flutter/material.dart';
import 'package:flutter_application_agustobrut/LogIn/log.dart';


class Sgn extends StatefulWidget {
  @override
  _SgnState createState() => _SgnState();
}

class _SgnState extends State<Sgn> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnfrmpasswordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {});
    });
    _userController.addListener(() {
      setState(() {}); // Rebuild to update the suffix icon
    });
    _passwordController.addListener(() {
      setState(() {}); // Rebuild to update the suffix icon
    });
    _cnfrmpasswordController.addListener(() {
      setState(() {}); // Rebuild to update the suffix icon
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    _cnfrmpasswordController.dispose();
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
                Padding(padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
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
                            'Full name',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'Enter name',
                                hintStyle: TextStyle(color: Color.fromARGB(98, 0, 0, 0)),
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.apple),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fillColor: const Color.fromARGB(147, 245, 245, 245),
                                filled: true,
                                suffixIcon: _nameController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          _nameController.clear();
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
                        ],
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm password',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: _cnfrmpasswordController,
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
                                    if (_cnfrmpasswordController.text.isNotEmpty)
                                      IconButton(
                                        onPressed: () {
                                          _cnfrmpasswordController.clear();
                                        },
                                        icon: const Icon(Icons.clear),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                          SizedBox(
                            child: Padding(padding: EdgeInsets.only(left: 5),
                            child: ElevatedButton(
                                          onPressed: () {
                                            // Menampilkan dialog saat tombol ditekan
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Success!!!"),
                                                  content: Text("data has been saved"),
                                                  actions: [
                                                    TextButton(
                                          onPressed: () {
                                            // Aksi yang ingin dilakukan jika tombol 'Done' diklik
                                            print('Tombol Done diklik');
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context, animation, secondaryAnimation) => MyTextField(),
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
                                            "Done",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
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
                                    "Register",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                     ),
                     SizedBox(height: 10),
                   Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 120),
                        child:  Text(
                      'already have account?',
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
                            pageBuilder: (context, animation, secondaryAnimation) => MyTextField(),
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
                          'LogIn',
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


