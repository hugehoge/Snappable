/// An alignment definition in snapping.
public enum SnapAlignment {
  /// A snap guide marking the top and leading edges of the view.
  @available(*, unavailable, message: "Not yet to support in horizontal + vertical movements.")
  case topLeading
  /// A snap guide marking the top edge of the view.
  case top
  /// A snap guide marking the top and trailing edges of the view.
  @available(*, unavailable, message: "Not yet to support in horizontal + vertical movements.")
  case topTrailing
  /// A snap guide marking the leading edge of the view.
  case leading
  /// A snap guide marking the center of the view.
  case center
  /// A snap guide marking the trailing edge of the view.
  case trailing
  /// A snap guide marking the bottom and leading edges of the view.
  @available(*, unavailable, message: "Not yet to support in horizontal + vertical movements.")
  case bottomLeading
  /// A snap guide marking the bottom edge of the view.
  case bottom
  /// A snap guide marking the bottom and trailing edges of the view.
  @available(*, unavailable, message: "Not yet to support in horizontal + vertical movements.")
  case bottomTrailing
}
