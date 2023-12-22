import 'package:flutter/material.dart';

const kPageMargin = EdgeInsets.symmetric(
    vertical: PaddingSizes.xs, horizontal: PaddingSizes.sm);

final kStandardBorderRadius = BorderRadius.circular(BorderRadiusSizes.md);

abstract class PaddingSizes {
  const PaddingSizes._();

  /// 2 units
  static const double xxxs = 2;

  /// 4 units
  static const double xxs = 4;

  /// 8 units
  static const double xs = 8;

  /// 12 units
  static const double sm = 12;

  /// 16 units
  static const double md = 16;

  /// 20 units
  static const double mdl = 20;

  /// 24 units
  static const double lg = 24;

  /// 32 units
  static const double xl = 32;

  /// 40 units
  static const double xxl = 40;

  /// 56 units
  static const double xxxl = 56;

  /// The horizontal padding applied to primary components of a page to separate them from the edge of the device.
  ///
  /// See also [HorizontalPadding]
  static const double horizontalEdge = md;
}

abstract class BorderRadiusSizes {
  const BorderRadiusSizes._();

  /// 2 units
  static const double xxxs = 2;

  /// 4 units
  static const double xxs = 4;

  /// 8 units
  static const double xs = 8;

  /// 12 units
  static const double sm = 12;

  /// 15 units
  static const double md = 15;

  /// 24 units
  static const double lg = 24;

  /// 32 units
  static const double xl = 32;

  /// 40 units
  static const double xxl = 40;
}
