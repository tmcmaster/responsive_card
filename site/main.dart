import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:responsive_card/responsive_card.dart';

import 'shared_style.dart';

//void main() => runApp(MyApp());

void main() => FlutterWorkbench.runAppWidgetTester(
      title: 'Responsive Card',
      styles: SharedStyle.themes,
      options: WidgetTesterOptions(
        aspectRatio: 2 / 3,
        columns: 2,
      ),
      children: [
        MyApp(),
        MyApp(),
      ],
    );

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
