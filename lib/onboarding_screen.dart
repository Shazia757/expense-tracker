import 'package:expense_management_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              'Spend Smarter',
              style: TextStyle(
                color: Color.fromRGBO(67, 136, 131, 255),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Save more',
              style: TextStyle(
                color: Color.fromRGBO(67, 136, 131, 255),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => HomeScreen())),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
