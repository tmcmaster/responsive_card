import 'package:flutter/material.dart';

part 'curve_edge_clipper.dart';
part 'image_clip_path.dart';
part 'responsive_card_layout.dart';

class ResponsiveCard extends StatelessWidget {
  late final Widget Function(BuildContext context) _titleBuilder;
  late final Widget Function(BuildContext context) _detailsBuilder;
  late final Widget Function(BuildContext context) _tagsBuilder;
  late final Widget Function(BuildContext context) _imageBuilder;
  late final bool _hasImage;
  late final bool curve;
  ResponsiveCard({
    Key? key,
    String? title,
    Widget? titleWidget,
    TextStyle? titleStyle,
    String? details,
    Widget? detailsWidget,
    Widget? tagsWidget,
    List<String> tagDefinitions = const [],
    String? imagePath,
    Widget? imageWidget,
    this.curve = false,
  }) : super(key: key) {
    _hasImage = imageWidget != null;
    _titleBuilder = (context) =>
        titleWidget ??
        (title != null
            ? Text(
                title,
                style: titleStyle ?? Theme.of(context).textTheme.headline3,
              )
            : SizedBox());
    _detailsBuilder = (context) =>
        detailsWidget ??
        (details != null
            ? Text(
                details,
                style: titleStyle ?? Theme.of(context).textTheme.bodyText1,
              )
            : SizedBox());
    _tagsBuilder = (context) =>
        tagsWidget ??
        (tagDefinitions != null
            ? Row(
                children: tagDefinitions
                    .map(
                      (d) => Icon(
                        Icons.favorite,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                    .toList(),
              )
            : SizedBox());
    // _imageBuilder = (context) => Container(
    //       color: Theme.of(context).colorScheme.primary,
    //     );
    _imageBuilder = (context) => Image.network(
          'https://images.unsplash.com/photo-1520942702018-0862200e6873?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVhY2h8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
          // fit: BoxFit.fitHeight,
        );
  }

  @override
  Widget build(BuildContext context) {
    final image = _imageBuilder(context);
    final details = Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleBuilder(context),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Expanded(
            child: _detailsBuilder(context),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: _tagsBuilder(context),
          ),
        ],
      ),
    );

    //print('ResponsiveCard building');

    return LayoutBuilder(
      builder: (context, constraints) {
        //print('Orientation: $orientation');

        final orientation = (constraints.maxHeight < constraints.maxWidth ? Axis.horizontal : Axis.vertical);
        final borderRadius = (constraints.maxWidth + constraints.maxHeight) / 35;
        final edgeRadius = curve ? borderRadius * 2 : 0.0;

        return Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            side: BorderSide(width: 0.5, color: Colors.grey.shade400),
          ),
          shadowColor: Colors.grey,
          child: ResponsiveCardLayout(
            image: ImageClipPath(
              image: image,
              orientation: orientation,
              cornerRadius: borderRadius,
              edgeRadius: edgeRadius,
            ),
            details: details,
            orientation: orientation,
          ),
        );
      },
    );
  }
}
