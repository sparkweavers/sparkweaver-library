/// Input Field Type variants
enum FcInputType {
  /// Single line text input
  text,

  /// Email input with keyboard type
  email,

  /// Password input (obscured text)
  password,

  /// Multiline text input
  multiline,
}

/// Input Field State
enum FcInputState {
  /// Default state
  normal,

  /// Focused state
  focused,

  /// Error state
  error,

  /// Disabled state
  disabled,
}
