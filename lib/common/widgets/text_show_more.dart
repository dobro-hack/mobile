import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextShowMore extends StatefulWidget {
  const TextShowMore({
    super.key,
    required this.text,
  });
  final String text;

  @override
  TextShowMoreState createState() => TextShowMoreState();
}

class TextShowMoreState extends State<TextShowMore> {
  bool _isExpanded = false;
  bool _shouldShowMoreButton = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTextOverflow();
    });
  }

  void _checkTextOverflow() {
    final renderBox = context.findRenderObject() as RenderBox;
    final width = renderBox.size.width;
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: width);

    if (textPainter.didExceedMaxLines) {
      setState(() {
        _shouldShowMoreButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _isExpanded ? null : 3,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        if (_shouldShowMoreButton)
          TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(_isExpanded ? 'Свернуть' : 'Показать полностью'),
          ),
      ],
    );
  }
}
