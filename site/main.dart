import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:responsive_card/src/responsive_card.dart';

import 'shared_style.dart';

void main() => FlutterWorkbench.runAppWidgetTester(
      title: 'Responsive Card',
      styles: SharedStyle.themes,
      options: WidgetTesterOptions(
        aspectRatio: 5 / 3,
        columns: 2,
      ),
      children: [
        ResponsiveCard(
          title: randomTitle(),
          details: randomDetails(),
          tagDefinitions: ['a', 'b', 'c'],
        ),
        ResponsiveCard(
          title: randomTitle(),
          details: randomDetails(),
        ),
        ResponsiveCard(
          title: randomTitle(),
        ),
        ResponsiveCard(
          title: 'title',
          titleStyle: TextStyle(fontSize: 70),
        ),
        ResponsiveCard(),
      ],
    );

final String a = 'aaaa';

final randomTitle = () => faker.lorem.words(1).join(' ');
final randomDetails = () => faker.lorem.words(15).join(' ');
