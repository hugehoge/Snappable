import SwiftUI

internal struct SnapAlignmentEnvironmentKey: EnvironmentKey {
  internal static var defaultValue: SnapAlignment = .center
}

internal extension EnvironmentValues {
  var snapAlignment: SnapAlignment {
    get { self[SnapAlignmentEnvironmentKey.self] }
    set { self[SnapAlignmentEnvironmentKey.self] = newValue }
  }
}
