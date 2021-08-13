part of 'responsive_card.dart';

class ResponsiveCardLayout extends StatelessWidget {
  final Widget image;
  final Widget details;
  final Axis orientation;

  const ResponsiveCardLayout({
    Key? key,
    required this.image,
    required this.details,
    required this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('_ResponsiveCardLayout building');
    final children = [
      Flexible(
        flex: 1,
        child: image,
      ),
      Flexible(
        flex: 2,
        child: details,
      ),
    ];

    return orientation == Axis.horizontal
        ? Row(
            children: children,
          )
        : Column(
            children: children,
          );
  }
}
