import 'package:flutter/material.dart';

class NeuTextStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final Color strokeColor;
  final Color fillColor;

  NeuTextStyle({
    required this.fontSize,
    required this.fontWeight,
    required this.strokeColor,
    required this.fillColor,
  });
}

mixin NeuText {
  // Define the NeuTextStyle
  NeuTextStyle get neuTextStyle => NeuTextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        strokeColor: Colors.grey[800]!,
        fillColor: Colors.grey[300]!,
      );

  // Return text widget with Neu style
  Widget customText(String text, {Color? fillColor}) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: TextStyle(
            fontSize: neuTextStyle.fontSize,
            fontWeight: neuTextStyle.fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = neuTextStyle.strokeColor,
          ),
        ),
        // Solid text as fill.
        Positioned(
          top: -2,
          left: -4,
          child: Text(
            text,
            style: TextStyle(
              fontSize: neuTextStyle.fontSize,
              fontWeight: neuTextStyle.fontWeight,
              color: fillColor ?? neuTextStyle.fillColor,
            ),
          ),
        ),
      ],
    );
  }
}
