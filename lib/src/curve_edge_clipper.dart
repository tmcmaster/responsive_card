part of 'responsive_card.dart';

class CurveEdgeClipper extends CustomClipper<Path> {
  final double borderRadius;
  final double edgeRadius;
  final Axis orientation;

  const CurveEdgeClipper({
    required this.borderRadius,
    required this.edgeRadius,
    required this.orientation,
  });

  @override
  Path getClip(Size size) {
    return orientation == Axis.horizontal ? _generateRightEdgeCurve(size) : _generateBottomEdgeCurve(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  Path _generateBottomEdgeCurve(Size size) {
    final path = Path();
    path.moveTo(0, borderRadius);
    path.lineTo(0, size.height - edgeRadius);
    path.quadraticBezierTo(-edgeRadius, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width + edgeRadius, size.height, size.width, size.height - edgeRadius);
    path.lineTo(size.width, borderRadius);
    path.quadraticBezierTo(size.width, 0, size.width - borderRadius, 0);
    path.lineTo(borderRadius, 0);
    path.quadraticBezierTo(0, 0, 0, borderRadius);
    return path;
  }

  Path _generateRightEdgeCurve(Size size) {
    final path = Path();
    path.moveTo(0, borderRadius);
    path.lineTo(0, size.height - borderRadius);
    path.quadraticBezierTo(0, size.height, borderRadius, size.height);
    path.lineTo(size.width - edgeRadius, size.height);
    path.quadraticBezierTo(size.width, size.height + edgeRadius, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, 0, size.width - edgeRadius, -edgeRadius);
    path.lineTo(borderRadius, 0);
    path.quadraticBezierTo(0, 0, 0, borderRadius);
    return path;
  }
}
