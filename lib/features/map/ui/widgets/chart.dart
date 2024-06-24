import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final List<int?> data;
  final List<int?> maxData;
  final List<String> months;

  const CustomLineChart({
    super.key,
    required this.data,
    required this.maxData,
    this.months = const [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ],
  });

  @override
  Widget build(BuildContext context) {
    double largeGap = 16; // Large gap between months
    double horizontalGap = 6; // Space for each day bar
    double chartWidth =
        horizontalGap * (data.length) + largeGap * (months.length - 1);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 200,
        width: chartWidth,
        child: CustomPaint(
          painter:
              LineChartPainter(data: data, maxData: maxData, months: months),
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<int?> data;
  final List<int?> maxData;
  final List<String> months;

  LineChartPainter({
    required this.data,
    required this.maxData,
    required this.months,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double smallGap = 2; // Small gap between days
    double largeGap = 16; // Large gap between months
    double barRadius = 10; // Radius for rounding corners
    double verticalPadding =
        30.0; // Padding for the vertical axis to leave space for labels
    int daysPerMonth = data.length ~/ months.length;

    // Calculate the horizontal gap dynamically to fit all data points
    double horizontalGap =
        (size.width - (months.length - 1) * largeGap) / data.length;

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    Paint highlightedBackgroundPaint = Paint()
      ..color = Colors.orangeAccent.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Paint maxLinePaint = Paint()
    //   ..color = Colors.redAccent
    //   ..strokeWidth = 2.0
    //   ..style = PaintingStyle.stroke;

    double currentX = 0;

    // Draw bars for each day
    for (int i = 0; i < data.length; i++) {
      late Paint paint;
      if (data[i] == null || maxData[i] == null) {
        paint = backgroundPaint;
      } else {
        paint = data[i]! > maxData[i]! * 0.7
            ? highlightedBackgroundPaint
            : backgroundPaint;
      }

      // Calculate the height of the bar to fill the available height
      // double normalizedDataHeight =
      //     (data[i] / maxData[i].toDouble()) * (size.height - verticalPadding);

      double left = currentX;
      double right = currentX + horizontalGap;

      // Determine rounded corners only for the first and last day of each month
      Radius topLeftRadius =
          Radius.circular(i % daysPerMonth == 0 ? barRadius : 0);
      Radius topRightRadius =
          Radius.circular((i + 1) % daysPerMonth == 0 ? barRadius : 0);
      Radius bottomLeftRadius =
          Radius.circular(i % daysPerMonth == 0 ? barRadius : 0);
      Radius bottomRightRadius =
          Radius.circular((i + 1) % daysPerMonth == 0 ? barRadius : 0);

      // Draw the bar for the day, ensuring it fills to the top of the chart area
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(
              left,
              0, // Start from the top of the chart area
              right,
              size.height - verticalPadding), // End at the bottom minus padding
          topLeft: topLeftRadius,
          topRight: topRightRadius,
          bottomLeft: bottomLeftRadius,
          bottomRight: bottomRightRadius,
        ),
        paint,
      );

      // Increment X position
      currentX +=
          horizontalGap + ((i + 1) % daysPerMonth == 0 ? largeGap : smallGap);
    }

    // Draw line for actual data
    Path dataPath = Path();
    currentX = 0;
    for (int i = 0; i < data.length; i++) {
      double x = currentX + horizontalGap / 2;
      late double y;
      if (data[i] == null || maxData[i] == null) {
        y = size.height - verticalPadding;
      } else if (data[i]! > maxData[i]!) {
        y = 0;
      } else {
        double normalizedDataHeight = (data[i]! / maxData[i]!.toDouble()) *
            (size.height - verticalPadding);
        y = size.height - normalizedDataHeight - verticalPadding;
      }

      if (i == 0) {
        dataPath.moveTo(x, y);
      } else {
        dataPath.lineTo(x, y);
      }

      currentX +=
          horizontalGap + ((i + 1) % daysPerMonth == 0 ? largeGap : smallGap);
    }
    canvas.drawPath(dataPath, linePaint);

    // Draw line for max data
    Path maxDataPath = Path();
    currentX = 0;
    for (int i = 0; i < maxData.length; i++) {
      if (data[i] == null || maxData[i] == null) continue;
      double x = currentX + horizontalGap / 2;
      double y = size.height -
          verticalPadding -
          (maxData[i]!.toDouble() / maxData[i]!.toDouble()) *
              (size.height - verticalPadding);

      if (i == 0) {
        maxDataPath.moveTo(x, y);
      } else {
        maxDataPath.lineTo(x, y);
      }

      currentX +=
          horizontalGap + ((i + 1) % daysPerMonth == 0 ? largeGap : smallGap);
    }

    // Draw month labels
    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < months.length; i++) {
      double x =
          (i * daysPerMonth + daysPerMonth / 2.0) * (horizontalGap + smallGap) +
              i * largeGap;

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
