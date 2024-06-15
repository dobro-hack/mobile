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
    // WidgetsBinding.instance.addPostFrameCallback((_) {
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
    // });
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

// import 'package:flutter/material.dart';

// class TextShowMore extends StatefulWidget {
//   const TextShowMore({
//     super.key,
//     required this.text,
//   });
//   final String text;

//   @override
//   TextShowMoreState createState() => TextShowMoreState();
// }

// class TextShowMoreState extends State<TextShowMore> {
//   bool _isExpanded = false;
//   bool _shouldShowMoreButton = false;
//   final GlobalKey _textKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _checkTextOverflow();
//     });
//   }

//   void _checkTextOverflow() {
//     final RenderBox renderBox =
//         _textKey.currentContext?.findRenderObject() as RenderBox;
//     if (renderBox != null) {
//       final textHeight = renderBox.size.height;

//       // Создаем невидимый текст для измерения полной высоты
//       final textPainter = TextPainter(
//         text: TextSpan(
//           text: widget.text,
//           style: Theme.of(context)
//               .textTheme
//               .bodyMedium, // Убедитесь, что стиль соответствует отображаемому тексту
//         ),
//         textDirection: TextDirection.ltr,
//         maxLines: null,
//       )..layout(maxWidth: renderBox.size.width);

//       final fullTextHeight = textPainter.size.height;

//       // Сравниваем высоту полного текста и текста с максимальными тремя строками
//       if (textHeight < fullTextHeight) {
//         setState(() {
//           _shouldShowMoreButton = true;
//         });
//       }

//       debugPrint('Text height: $textHeight, Full text height: $fullTextHeight');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Виджет для отображения текста
//         Text(
//           widget.text,
//           key: _textKey,
//           maxLines: _isExpanded ? null : 3,
//           overflow: TextOverflow.ellipsis,
//         ),
//         // Кнопка "Показать полностью"
//         if (_shouldShowMoreButton)
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _isExpanded = !_isExpanded;
//               });
//             },
//             child: Text(_isExpanded ? 'Свернуть' : 'Показать полностью'),
//           ),
//       ],
//     );
//   }
// }
