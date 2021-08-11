import 'package:flutter/material.dart';

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello World'),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 50,
            height: 50,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
