import 'package:flutter/material.dart';
import 'package:github_demo/resources.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onLogin;
  const LoginPage({Key? key, required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  const Color(0xff6F48C1).withOpacity(0.5)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: -100,
            bottom: -150,
            child: Image.asset(
              'assets/globe.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xff043A8A),
                  const Color(0xff043A8A).withOpacity(0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 40,
            right: -60,
            bottom: 0,
            child: Image.asset(
              'assets/octocat.png',
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xff043A8A).withOpacity(0.8),
                  const Color(0xff043A8A).withOpacity(0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  onPressed: () => onLogin(),
                  child: const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('Login to Github', style: TextStyle(fontSize: 18),),
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
