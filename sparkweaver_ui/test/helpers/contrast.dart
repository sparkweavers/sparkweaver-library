import 'dart:math' as math;

import 'package:flutter/material.dart';

/// WCAG 2.1 contrast ratio. [Color.computeLuminance] is the relative
/// luminance the spec defines.
double contrastRatio(Color background, Color foreground) {
  final a = background.computeLuminance();
  final b = foreground.computeLuminance();
  return (math.max(a, b) + 0.05) / (math.min(a, b) + 0.05);
}
