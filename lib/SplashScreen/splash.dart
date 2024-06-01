import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/LogIn/log.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
@override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return MyTextField();
      }));
    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(255, 101, 170, 227), Color.fromARGB(255, 171, 176, 207)],
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          ),
        ),
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
            Icons.menu_book,
            size: 80,
            color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Library Mobile',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 32,
              ),
            )
          ],
        ),

      ),
    );
  }
}