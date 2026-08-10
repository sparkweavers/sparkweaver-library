import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_avatar.dart';
import '../atoms/fc_text.dart';

/// A single entry in [FcAppDrawer].
class FcDrawerItem {
  /// Leading icon shown next to the label.
  final IconData icon;

  /// Item label.
  final String label;

  /// Tap handler.
  final VoidCallback onTap;

  /// Optional trailing widget (e.g. badge, chevron).
  final Widget? trailing;

  const FcDrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
  });
}

/// Sparkweaver App Drawer Component (Organism)
///
/// A reusable side drawer with a user header, an optional list of
/// navigation items, and a free-form footer slot.
///
/// The component is auth-agnostic: provide [userName] and pass any
/// auth actions in via the [footer] widget (e.g. a logout
/// [FcButton]) or as [FcDrawerItem.onTap] callbacks.
///
/// ## Usage
///
/// ```dart
/// FcAppDrawer(
///   userName: 'Anonymous',
///   onUserNameTap: () => showEditNameDialog(context),
///   userNameTrailing: const Icon(Icons.edit_outlined, size: 18),
///   items: [
///     FcDrawerItem(
///       icon: Icons.settings,
///       label: 'Settings',
///       onTap: () => Navigator.pushNamed(context, '/settings'),
///     ),
///   ],
///   footer: FcButton(
///     label: 'Logout',
///     icon: Icons.logout,
///     variant: FcButtonVariant.text,
///     fullWidth: true,
///     onPressed: onLogout,
///   ),
/// )
/// ```
class FcAppDrawer extends StatelessWidget {
  /// Display name shown in the header.
  final String userName;

  /// Optional subtitle rendered under [userName] (e.g. email, plan).
  final String? userSubtitle;

  /// Optional avatar override. Defaults to [FcAvatar.user] at xxl size.
  final Widget? userAvatar;

  /// Optional tap handler for the user-name region. When non-null, the
  /// name (and [userNameTrailing], if provided) becomes tappable with an
  /// ink ripple, suitable for opening an edit-name dialog or profile
  /// page. When null, the name renders as plain text exactly as before.
  final VoidCallback? onUserNameTap;

  /// Optional widget rendered to the right of [userName] with a small
  /// horizontal gap. Typical use is a subtle edit-pencil icon to hint
  /// that the name is editable. Independent of [onUserNameTap], so it
  /// can also serve as a non-tappable status badge.
  final Widget? userNameTrailing;

  /// Navigation items rendered below the header.
  final List<FcDrawerItem> items;

  /// Free-form footer slot pinned to the bottom of the drawer.
  final Widget? footer;

  /// Padding around the drawer content.
  final EdgeInsetsGeometry padding;

  const FcAppDrawer({
    super.key,
    required this.userName,
    this.userSubtitle,
    this.userAvatar,
    this.onUserNameTap,
    this.userNameTrailing,
    this.items = const [],
    this.footer,
    this.padding = SparkweaverSpacing.edgeInsetsLg,
  });

  Widget _buildItem(BuildContext context, FcDrawerItem item) {
    final colors = SparkweaverTheme.of(context);
    return ListTile(
      leading: Icon(item.icon, color: colors.textPrimary),
      title: FcText(
        item.label,
        style: FcTextStyle.bodyMedium,
        color: colors.textPrimary,
      ),
      trailing: item.trailing,
      onTap: item.onTap,
    );
  }

  /// Build the user-name area, optionally wrapping it in an [InkWell]
  /// and laying out a trailing widget to the right of the text.
  Widget _buildUserName(BuildContext context) {
    final Widget nameText = FcText(
      userName,
      style: FcTextStyle.heading5,
      textAlign: TextAlign.center,
    );

    final Widget nameRow = userNameTrailing == null
        ? nameText
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: nameText),
              SparkweaverSpacing.horizontalSpaceSm,
              userNameTrailing!,
            ],
          );

    if (onUserNameTap == null) {
      return nameRow;
    }

    return InkWell(
      borderRadius: SparkweaverTokens.borderRadiusMd,
      onTap: onUserNameTap,
      child: Padding(
        padding: SparkweaverSpacing.inputPaddingInsets,
        child: nameRow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatar =
        userAvatar ?? FcAvatar.user(context: context, size: FcAvatarSizes.xxl);

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    avatar,
                    SparkweaverSpacing.verticalSpaceMd,
                    _buildUserName(context),
                    if (userSubtitle != null) ...[
                      SparkweaverSpacing.verticalSpaceXs,
                      FcText(
                        userSubtitle!,
                        style: FcTextStyle.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
              if (items.isNotEmpty) ...[
                SparkweaverSpacing.verticalSpaceLg,
                const Divider(),
                ...items.map((item) => _buildItem(context, item)),
              ],
              const Spacer(),
              if (footer != null) footer!,
            ],
          ),
        ),
      ),
    );
  }
}
