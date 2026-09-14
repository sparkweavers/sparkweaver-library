part of 'fc_input_field.dart';

class _FcInputFieldState extends State<FcInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? widget.type == FcInputType.password;
  }

  @override
  void didUpdateWidget(FcInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.obscureText != null &&
        widget.obscureText != oldWidget.obscureText) {
      _obscureText = widget.obscureText!;
    }
  }

  void _toggleObscureText() => setState(() => _obscureText = !_obscureText);

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case FcInputType.email:
        return TextInputType.emailAddress;
      case FcInputType.multiline:
        return TextInputType.multiline;
      case FcInputType.text:
      case FcInputType.password:
        return TextInputType.text;
    }
  }

  int? _getMaxLines() {
    if (widget.type == FcInputType.multiline) {
      return widget.maxLines ?? 3;
    }
    return widget.maxLines ?? 1;
  }

  int? _getMinLines() {
    if (widget.type == FcInputType.multiline) {
      return widget.minLines ?? 1;
    }
    return null;
  }

  Widget? _buildSuffixIcon(SparkweaverTheme colors) {
    final iconColor = widget.errorText != null
        ? colors.error
        : colors.textSecondary;
    if (widget.suffixIcon != null) {
      return IconButton(
        icon: Icon(widget.suffixIcon, color: iconColor),
        onPressed: widget.onSuffixIconPressed,
      );
    }
    if (widget.type != FcInputType.password) return null;
    return IconButton(
      icon: Icon(
        _obscureText
            ? SparkweaverIcons.actionVisibility
            : SparkweaverIcons.actionVisibilityOff,
        color: iconColor,
      ),
      onPressed: widget.enabled ? _toggleObscureText : null,
      tooltip: _obscureText
          ? widget.showPasswordLabel
          : widget.hidePasswordLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      obscureText: _obscureText,
      keyboardType: _getKeyboardType(),
      textInputAction: widget.textInputAction,
      maxLines: _getMaxLines(),
      minLines: _getMinLines(),
      maxLength: widget.showCounter ? widget.maxLength : null,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      style: SparkweaverTypography.bodyMedium.copyWith(
        color: widget.enabled ? colors.textPrimary : colors.textDisabled,
      ),
      decoration: buildFcInputDecoration(
        colors: colors,
        enabled: widget.enabled,
        labelText: widget.labelText,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(colors),
      ),
    );
  }
}
