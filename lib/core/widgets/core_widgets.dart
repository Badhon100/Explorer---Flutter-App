import 'package:flutter/material.dart';

class MyTextStyle extends TextStyle {
  const MyTextStyle({
    super.inherit = true,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    super.overflow,
  }) : super(fontFamily: 'Inter');
}

commonText(
  String text, {
  Color color = Colors.white,
  double size = 12,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLine,
  TextAlign textAlign = TextAlign.start,
}) => Text(
  text,
  style: MyTextStyle(fontSize: size, fontWeight: fontWeight),
  maxLines: maxLine,
  overflow: TextOverflow.visible,
  textAlign: textAlign, // Align text as specified
  softWrap: true,
);
