import SwiftUI

public extension ScrollView {
  /// Make the ScrollView snappable.
  /// - Parameters:
  ///   - alignment: Alignment that is used as a guide for snapping.
  ///   - mode: The mode by when ScrollView snaps the items.
  /// - Returns: A ScrollView, with the snapping behavior set.
  func snappable(
    alignment: SnapAlignment = .center,
    mode: SnapMode = .immediately
  ) -> some View {
    self.modifier(SnappableModifier(alignment: alignment, mode: mode))
  }
}
