import SwiftUI

public extension ScrollView {
  func snappable(
    _ alignment: SnapAlignment = .center,
    mode: SnapMode = .afterScrolling
  ) -> some View {
    self.modifier(SnappableModifier(alignment: alignment, mode: mode))
  }
}
