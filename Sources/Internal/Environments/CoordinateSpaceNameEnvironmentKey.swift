import SwiftUI

internal struct CoordinateSpaceNameEnvironmentKey: EnvironmentKey {
  internal static var defaultValue: UUID = UUID()
}

internal extension EnvironmentValues {
  var coordinateSpaceName: UUID {
    get { self[CoordinateSpaceNameEnvironmentKey.self] }
    set { self[CoordinateSpaceNameEnvironmentKey.self] = newValue }
  }
}
