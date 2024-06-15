import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final List<int> data;
  final List<String> months;

  CustomLineChart({required this.data, required this.months});

  @override
  Widget build(BuildContext context) {
    // int weeksPerMonth = data.length ~/ months.length;
    double smallGap = 4; // Маленький отступ между столбцами одного месяца
    double largeGap = 16; // Большой отступ между месяцами
    double horizontalGap = 50;
    double chartWidth =
        (horizontalGap + smallGap) * (data.length - months.length) +
            largeGap * months.length;
    return SizedBox(
      height: 180,
      width: chartWidth,
      child: CustomPaint(
        painter: LineChartPainter(data: data, months: months),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<int> data;
  final List<String> months;

  LineChartPainter({required this.data, required this.months});

  @override
  void paint(Canvas canvas, Size size) {
    double maxDataValue =
        10.0; // Максимальное значение в данных (для нормализации)
    int weeksPerMonth = data.length ~/ months.length;
    double smallGap = 4; // Маленький отступ между столбцами одного месяца
    double largeGap = 16; // Большой отступ между месяцами
    double horizontalGap =
        (size.width - (months.length - 1) * largeGap) / data.length;
    double verticalScale =
        (size.height - 20) / maxDataValue; // Учтем место для подписей
    double barRadius = 10; // Радиус скругления углов

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    Paint highlightedBackgroundPaint = Paint()
      ..color = Colors.orangeAccent.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    double currentX = 0;
    for (int i = 0; i < data.length; i++) {
      Paint paint = data[i] > 7 ? highlightedBackgroundPaint : backgroundPaint;

      double left =
          currentX + (i % weeksPerMonth == 0 ? largeGap / 2 : smallGap / 2);
      double right = currentX +
          horizontalGap -
          (i % weeksPerMonth == weeksPerMonth - 1
              ? largeGap / 2
              : smallGap / 2);

      // Скругления только с одной стороны
      Radius topLeftRadius =
          Radius.circular(i % weeksPerMonth == 0 ? barRadius : 0);
      Radius topRightRadius = Radius.circular(
          i % weeksPerMonth == weeksPerMonth - 1 ? barRadius : 0);
      Radius bottomLeftRadius =
          Radius.circular(i % weeksPerMonth == 0 ? barRadius : 0);
      Radius bottomRightRadius = Radius.circular(
          i % weeksPerMonth == weeksPerMonth - 1 ? barRadius : 0);

      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(left, 0, right, size.height - 20),
          topLeft: topLeftRadius,
          topRight: topRightRadius,
          bottomLeft: bottomLeftRadius,
          bottomRight: bottomRightRadius,
        ),
        paint,
      );

      currentX += horizontalGap +
          (i % weeksPerMonth == weeksPerMonth - 1 ? largeGap : smallGap);
    }

    //  линию графика
    Path path = Path();
    currentX = 0;
    for (int i = 0; i < data.length; i++) {
      double x = currentX + horizontalGap / 2;
      double y = size.height - 20 - (data[i] * verticalScale);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      currentX += horizontalGap +
          (i % weeksPerMonth == weeksPerMonth - 1 ? largeGap : smallGap);
    }
    canvas.drawPath(path, linePaint);

    //  месяцы под графиком
    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < months.length; i++) {
      double x = (i * weeksPerMonth + (weeksPerMonth - 1) / 2) *
              (horizontalGap + smallGap) +
          i * largeGap; // Позиция месяца
      textPainter.text = TextSpan(
        text: months[i],
        style: const TextStyle(color: Colors.black, fontSize: 16),
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, size.height - 18),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
