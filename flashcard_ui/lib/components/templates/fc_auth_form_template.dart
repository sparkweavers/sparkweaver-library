import 'package:flutter/material.dart';
import '../atoms/fc_button.dart';
import '../organisms/fc_header.dart';

/// Flashcard Auth Form Template
///
/// A centered form layout template for authentication screens.
/// Used for sign in, sign up, forgot password, etc.
///
/// ## Usage
///
/// ```dart
/// FcAuthFormTemplate(
///   title: 'Sign In',
///   fields: [
///     AuthFormField(
///       label: 'Email',
///       controller: _emailController,
///       type: FcInputType.email,
///     ),
///     AuthFormField(
///       label: 'Password',
///       controller: _passwordController,
///       type: FcInputType.password,
///     ),
///   ],
///   submitButtonLabel: 'Sign In',
///   onSubmit: () async {
///     // Handle sign in
///   },
///   footer: TextButton(
///     onPressed: () => Navigator.pushNamed(context, '/signup'),
///     child: Text('Don\'t have an account? Sign up'),
///   ),
/// )
/// ```
class FcAuthFormTemplate extends StatelessWidget {
  /// Form title
  final String title;

  /// Form fields
  final List<Widget> fields;

  /// Submit button label
  final String submitButtonLabel;

  /// Callback when submit button is pressed
  final VoidCallback onSubmit;

  /// Whether submission is in progress
  final bool isLoading;

  /// Footer widget (e.g., link to other auth screen)
  final Widget? footer;

  /// Custom app bar
  final PreferredSizeWidget? appBar;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  const FcAuthFormTemplate({
    super.key,
    required this.title,
    required this.fields,
    required this.submitButtonLabel,
    required this.onSubmit,
    this.isLoading = false,
    this.footer,
    this.appBar,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? FcHeader(title: title),
      body: Center(
        child: SingleChildScrollView(
          padding: padding ?? const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Form fields
              ...fields.map((field) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: field,
                  )),

              const SizedBox(height: 8),

              // Submit button
              FcButton(
                label: submitButtonLabel,
                onPressed: isLoading ? null : onSubmit,
                isLoading: isLoading,
                fullWidth: true,
              ),

              // Footer
              if (footer != null) ...[
                const SizedBox(height: 16),
                Center(child: footer!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
