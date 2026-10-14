import 'package:expense_management_app/home_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.svg'),
            Text(
              'Spend Smarter',
              style: TextStyle(color: Color.fromRGBO(67, 136, 131, 255)),
            ),
            Text(
              'Save more',
              style: TextStyle(color: Color.fromRGBO(67, 136, 131, 255)),
            ),
            FilledButton(
              // style: ButtonStyle(backgroundColor: ),
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
