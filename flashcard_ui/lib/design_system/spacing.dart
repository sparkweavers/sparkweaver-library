import 'package:flutter/widgets.dart';

/// Flashcard UI Design System - Spacing
///
/// Defines the spacing system for consistent layout and padding.
/// Uses a scale based on multiples of 4 for rhythm and consistency.
class FlashcardSpacing {
  FlashcardSpacing._();

  // ============================================================
  // Base Spacing Unit
  // ============================================================

  /// Base spacing unit (4px) - All spacing derives from this
  static const double base = 4.0;

  // ============================================================
  // Spacing Scale (Multiples of Base)
  // ============================================================

  /// 0px
  static const double none = 0.0;

  /// 2px (base * 0.5)
  static const double xxs = base * 0.5;

  /// 4px (base * 1)
  static const double xs = base * 1;

  /// 8px (base * 2)
  static const double sm = base * 2;

  /// 12px (base * 3)
  static const double md = base * 3;

  /// 16px (base * 4)
  static const double lg = base * 4;

  /// 24px (base * 6)
  static const double xl = base * 6;

  /// 32px (base * 8)
  static const double xxl = base * 8;

  /// 48px (base * 12)
  static const double xxxl = base * 12;

  /// 64px (base * 16)
  static const double huge = base * 16;

  // ============================================================
  // Semantic Spacing (Named by Purpose)
  // ============================================================

  /// Padding inside small components (4px)
  static const double paddingXs = xs;

  /// Padding inside medium components (8px)
  static const double paddingSm = sm;

  /// Standard padding (12px)
  static const double paddingMd = md;

  /// Large padding (16px)
  static const double paddingLg = lg;

  /// Extra large padding (24px)
  static const double paddingXl = xl;

  /// Margin between components (8px)
  static const double marginSm = sm;

  /// Standard margin (12px)
  static const double marginMd = md;

  /// Large margin (16px)
  static const double marginLg = lg;

  /// Extra large margin (24px)
  static const double marginXl = xl;

  /// Section spacing (32px)
  static const double sectionSpacing = xxl;

  /// Page padding (16px)
  static const double pagePadding = lg;

  /// Card padding (16px)
  static const double cardPadding = lg;

  /// Button padding horizontal (24px)
  static const double buttonPaddingH = xl;

  /// Button padding vertical (12px)
  static const double buttonPaddingV = md;

  /// Input padding horizontal (12px)
  static const double inputPaddingH = md;

  /// Input padding vertical (8px)
  static const double inputPaddingV = sm;

  // ============================================================
  // EdgeInsets Presets
  // ============================================================

  /// No padding/margin
  static const EdgeInsets edgeInsetsNone = EdgeInsets.zero;

  /// All sides: 4px
  static const EdgeInsets edgeInsetsXs = EdgeInsets.all(xs);

  /// All sides: 8px
  static const EdgeInsets edgeInsetsSm = EdgeInsets.all(sm);

  /// All sides: 12px
  static const EdgeInsets edgeInsetsMd = EdgeInsets.all(md);

  /// All sides: 16px
  static const EdgeInsets edgeInsetsLg = EdgeInsets.all(lg);

  /// All sides: 24px
  static const EdgeInsets edgeInsetsXl = EdgeInsets.all(xl);

  /// All sides: 32px
  static const EdgeInsets edgeInsetsXxl = EdgeInsets.all(xxl);

  // ============================================================
  // Symmetric EdgeInsets Presets
  // ============================================================

  /// Horizontal: 8px
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);

  /// Horizontal: 12px
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);

  /// Horizontal: 16px
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  /// Horizontal: 24px
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);

  /// Vertical: 8px
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);

  /// Vertical: 12px
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);

  /// Vertical: 16px
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  /// Vertical: 24px
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(vertical: xl);

  // ============================================================
  // Component-Specific EdgeInsets
  // ============================================================

  /// Standard page padding (16px all sides)
  static const EdgeInsets pagePaddingInsets = EdgeInsets.all(pagePadding);

  /// Card padding (16px all sides)
  static const EdgeInsets cardPaddingInsets = EdgeInsets.all(cardPadding);

  /// Button padding (horizontal: 24px, vertical: 12px)
  static const EdgeInsets buttonPaddingInsets = EdgeInsets.symmetric(
    horizontal: buttonPaddingH,
    vertical: buttonPaddingV,
  );

  /// Input padding (horizontal: 12px, vertical: 8px)
  static const EdgeInsets inputPaddingInsets = EdgeInsets.symmetric(
    horizontal: inputPaddingH,
    vertical: inputPaddingV,
  );

  /// Chat bubble padding (horizontal: 12px, vertical: 8px)
  static const EdgeInsets chatBubblePadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// Chat bubble margin (vertical: 4px)
  static const EdgeInsets chatBubbleMargin = EdgeInsets.symmetric(
    vertical: xs,
  );

  /// Badge padding (all: 6px)
  static const EdgeInsets badgePadding = EdgeInsets.all(6.0);

  // ============================================================
  // SizedBox Presets (for spacing between widgets)
  // ============================================================

  /// Vertical spacing: 4px
  static const SizedBox verticalSpaceXs = SizedBox(height: xs);

  /// Vertical spacing: 8px
  static const SizedBox verticalSpaceSm = SizedBox(height: sm);

  /// Vertical spacing: 12px
  static const SizedBox verticalSpaceMd = SizedBox(height: md);

  /// Vertical spacing: 16px
  static const SizedBox verticalSpaceLg = SizedBox(height: lg);

  /// Vertical spacing: 24px
  static const SizedBox verticalSpaceXl = SizedBox(height: xl);

  /// Vertical spacing: 32px
  static const SizedBox verticalSpaceXxl = SizedBox(height: xxl);

  /// Horizontal spacing: 4px
  static const SizedBox horizontalSpaceXs = SizedBox(width: xs);

  /// Horizontal spacing: 8px
  static const SizedBox horizontalSpaceSm = SizedBox(width: sm);

  /// Horizontal spacing: 12px
  static const SizedBox horizontalSpaceMd = SizedBox(width: md);

  /// Horizontal spacing: 16px
  static const SizedBox horizontalSpaceLg = SizedBox(width: lg);

  /// Horizontal spacing: 24px
  static const SizedBox horizontalSpaceXl = SizedBox(width: xl);

  /// Horizontal spacing: 32px
  static const SizedBox horizontalSpaceXxl = SizedBox(width: xxl);

  // ============================================================
  // Gap Sizes (for Flex layouts with gap parameter)
  // ============================================================

  /// Gap: 4px
  static const double gapXs = xs;

  /// Gap: 8px
  static const double gapSm = sm;

  /// Gap: 12px
  static const double gapMd = md;

  /// Gap: 16px
  static const double gapLg = lg;

  /// Gap: 24px
  static const double gapXl = xl;
}
