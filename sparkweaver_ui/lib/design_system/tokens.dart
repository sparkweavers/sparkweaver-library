import 'package:flutter/material.dart';

/// Sparkweaver UI Design System - Design Tokens
///
/// Defines the design tokens for border radius, shadows, elevation,
/// opacity values, and other visual properties.
class SparkweaverTokens {
  SparkweaverTokens._();

  // ============================================================
  // Border Radius
  // ============================================================

  /// No border radius (0px)
  static const double radiusNone = 0.0;

  /// Extra small border radius (2px)
  static const double radiusXs = 2.0;

  /// Small border radius (4px)
  static const double radiusSm = 4.0;

  /// Medium border radius (8px)
  static const double radiusMd = 8.0;

  /// Large border radius (12px)
  static const double radiusLg = 12.0;

  /// Extra large border radius (16px)
  static const double radiusXl = 16.0;

  /// 2X large border radius (20px)
  static const double radiusXxl = 20.0;

  /// 3X large border radius (24px)
  static const double radiusXxxl = 24.0;

  /// Circular border radius (9999px)
  static const double radiusFull = 9999.0;

  // ============================================================
  // Border Radius Presets
  // ============================================================

  /// No border radius
  static const BorderRadius borderRadiusNone = BorderRadius.zero;

  /// Small border radius (4px)
  static const BorderRadius borderRadiusSm = BorderRadius.all(
    Radius.circular(radiusSm),
  );

  /// Medium border radius (8px)
  static const BorderRadius borderRadiusMd = BorderRadius.all(
    Radius.circular(radiusMd),
  );

  /// Large border radius (12px)
  static const BorderRadius borderRadiusLg = BorderRadius.all(
    Radius.circular(radiusLg),
  );

  /// Extra large border radius (16px)
  static const BorderRadius borderRadiusXl = BorderRadius.all(
    Radius.circular(radiusXl),
  );

  /// 2X large border radius (20px)
  static const BorderRadius borderRadiusXxl = BorderRadius.all(
    Radius.circular(radiusXxl),
  );

  /// Circular border radius
  static const BorderRadius borderRadiusFull = BorderRadius.all(
    Radius.circular(radiusFull),
  );

  // ============================================================
  // Component-Specific Border Radius
  // ============================================================

  /// Button border radius (8px)
  static const BorderRadius buttonRadius = borderRadiusMd;

  /// Card border radius (12px)
  static const BorderRadius cardRadius = borderRadiusLg;

  /// Input border radius (8px)
  static const BorderRadius inputRadius = borderRadiusMd;

  /// Chat bubble border radius (16px)
  static const BorderRadius chatBubbleRadius = borderRadiusXl;

  /// Badge border radius (8px)
  static const BorderRadius badgeRadius = borderRadiusMd;

  /// Dialog border radius (12px)
  static const BorderRadius dialogRadius = borderRadiusLg;

  /// Avatar border radius (circular)
  static const BorderRadius avatarRadius = borderRadiusFull;

  // ============================================================
  // Border Width
  // ============================================================

  /// No border (0px)
  static const double borderWidthNone = 0.0;

  /// Thin border (1px)
  static const double borderWidthThin = 1.0;

  /// Medium border (2px)
  static const double borderWidthMedium = 2.0;

  /// Thick border (3px)
  static const double borderWidthThick = 3.0;

  /// Extra thick border (4px)
  static const double borderWidthExtraThick = 4.0;

  // ============================================================
  // Elevation (Shadow Depth)
  // ============================================================

  /// No elevation
  static const double elevationNone = 0.0;

  /// Minimal elevation (1dp)
  static const double elevationXs = 1.0;

  /// Small elevation (2dp)
  static const double elevationSm = 2.0;

  /// Medium elevation (4dp)
  static const double elevationMd = 4.0;

  /// Large elevation (8dp)
  static const double elevationLg = 8.0;

  /// Extra large elevation (12dp)
  static const double elevationXl = 12.0;

  /// 2X large elevation (16dp)
  static const double elevationXxl = 16.0;

  /// 3X large elevation (24dp)
  static const double elevationXxxl = 24.0;

  // ============================================================
  // Box Shadows (Custom Shadows)
  // ============================================================

  /// No shadow
  static const List<BoxShadow> shadowNone = [];

  /// Small shadow
  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Color(0x1A000000), // Black with 10% opacity
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  /// Medium shadow
  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Color(0x1A000000), // Black with 10% opacity
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  /// Large shadow
  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Color(0x1F000000), // Black with 12% opacity
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  /// Extra large shadow
  static const List<BoxShadow> shadowXl = [
    BoxShadow(
      color: Color(0x26000000), // Black with 15% opacity
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  // ============================================================
  // Opacity Values
  // ============================================================

  /// Fully transparent (0%)
  static const double opacityTransparent = 0.0;

  /// Barely visible (5%)
  static const double opacity5 = 0.05;

  /// Very subtle (10%)
  static const double opacity10 = 0.1;

  /// Subtle (15%)
  static const double opacity15 = 0.15;

  /// Light (20%)
  static const double opacity20 = 0.2;

  /// Medium-light (30%)
  static const double opacity30 = 0.3;

  /// Medium (40%)
  static const double opacity40 = 0.4;

  /// Half (50%)
  static const double opacity50 = 0.5;

  /// Medium-strong (60%)
  static const double opacity60 = 0.6;

  /// Strong (70%)
  static const double opacity70 = 0.7;

  /// Very strong (80%)
  static const double opacity80 = 0.8;

  /// Almost opaque (90%)
  static const double opacity90 = 0.9;

  /// Almost fully opaque (95%)
  static const double opacity95 = 0.95;

  /// Fully opaque (100%)
  static const double opacityOpaque = 1.0;

  // ============================================================
  // Icon Sizes
  // ============================================================

  /// Extra small icon (12px)
  static const double iconXs = 12.0;

  /// Small icon (16px)
  static const double iconSm = 16.0;

  /// Medium icon (20px)
  static const double iconMd = 20.0;

  /// Large icon (24px)
  static const double iconLg = 24.0;

  /// Extra large icon (32px)
  static const double iconXl = 32.0;

  /// 2X large icon (48px)
  static const double iconXxl = 48.0;

  /// 3X large icon (64px)
  static const double iconXxxl = 64.0;

  // ============================================================
  // Avatar Sizes
  // ============================================================

  /// Extra small avatar (16px)
  static const double avatarXs = 16.0;

  /// Small avatar (24px)
  static const double avatarSm = 24.0;

  /// Medium avatar (32px)
  static const double avatarMd = 32.0;

  /// Large avatar (40px)
  static const double avatarLg = 40.0;

  /// Extra large avatar (48px)
  static const double avatarXl = 48.0;

  /// 2X large avatar (64px)
  static const double avatarXxl = 64.0;

  /// 3X large avatar (96px)
  static const double avatarXxxl = 96.0;

  // ============================================================
  // Animation Durations (milliseconds)
  // ============================================================

  /// Instant (0ms)
  static const Duration durationInstant = Duration.zero;

  /// Very fast (75ms)
  static const Duration durationFast = Duration(milliseconds: 75);

  /// Fast (150ms)
  static const Duration durationNormal = Duration(milliseconds: 150);

  /// Medium (300ms)
  static const Duration durationMedium = Duration(milliseconds: 300);

  /// Slow (500ms)
  static const Duration durationSlow = Duration(milliseconds: 500);

  /// Very slow (1000ms)
  static const Duration durationVerySlow = Duration(milliseconds: 1000);

  // ============================================================
  // Animation Curves
  // ============================================================

  /// Linear curve
  static const Curve curveLinear = Curves.linear;

  /// Ease curve
  static const Curve curveEase = Curves.ease;

  /// Ease in curve
  static const Curve curveEaseIn = Curves.easeIn;

  /// Ease out curve
  static const Curve curveEaseOut = Curves.easeOut;

  /// Ease in out curve
  static const Curve curveEaseInOut = Curves.easeInOut;

  /// Bounce curve
  static const Curve curveBounce = Curves.bounceOut;

  /// Elastic curve
  static const Curve curveElastic = Curves.elasticOut;

  // ============================================================
  // Z-Index (Stacking Order)
  // ============================================================

  /// Base level
  static const int zIndexBase = 0;

  /// Dropdown level
  static const int zIndexDropdown = 100;

  /// Sticky level
  static const int zIndexSticky = 200;

  /// Fixed level
  static const int zIndexFixed = 300;

  /// Modal backdrop level
  static const int zIndexModalBackdrop = 400;

  /// Modal level
  static const int zIndexModal = 500;

  /// Popover level
  static const int zIndexPopover = 600;

  /// Tooltip level
  static const int zIndexTooltip = 700;

  /// Notification level
  static const int zIndexNotification = 800;

  /// Maximum level
  static const int zIndexMax = 999;
}
