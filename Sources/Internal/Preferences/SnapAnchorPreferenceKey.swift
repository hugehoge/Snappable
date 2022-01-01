import SwiftUI

internal struct SnapAnchorPreferenceKey: PreferenceKey {
  internal static var defaultValue: [SnapID: CGPoint] = [:]

  internal static func reduce(
    value: inout [SnapID: CGPoint],
    nextValue: () -> [SnapID: CGPoint]
  ) {
    for (id, anchor) in nextValue() {
      value[id] = anchor
    }
  }
}
