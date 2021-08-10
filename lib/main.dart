import 'package:flutter/material.dart';
import 'package:responsive_card/responsive_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello World'),
                SizedBox(
                  height: 20,
                ),
                ResponsiveCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
