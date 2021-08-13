part of 'responsive_card.dart';

class ImageClipPath extends StatelessWidget {
  final Widget image;
  final Axis orientation;
  final double cornerRadius;
  final double edgeRadius;

  ImageClipPath({
    Key? key,
    required this.image,
    required this.orientation,
    required this.cornerRadius,
    required this.edgeRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveEdgeClipper(
        borderRadius: cornerRadius,
        edgeRadius: edgeRadius,
        orientation: orientation,
      ),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          fit: orientation == Axis.horizontal ? BoxFit.fitHeight : BoxFit.fitWidth,
          child: image,
        ),
      ),
    );
  }
}
