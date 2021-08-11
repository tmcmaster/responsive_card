import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:responsive_card/responsive_card.dart';

import 'shared_style.dart';

void main() => FlutterWorkbench.runAppWidgetTester(
      title: 'Responsive Card',
      styles: SharedStyle.themes,
      options: WidgetTesterOptions(
        aspectRatio: 2 / 3,
        columns: 2,
      ),
      children: [
        ResponsiveCard(),
        ResponsiveCard(),
        ResponsiveCard(),
        ResponsiveCard(),
      ],
    );
