import SwiftUI

public extension View {
  /// Make the View a snap target.
  ///
  /// `snapID(_:)` applies [id(\_:)](https://developer.apple.com/documentation/swiftui/view/id(_:))
  /// modifier internally. Therefore, there is no need to apply `id(_:)` modifier additionally, and if you do, it will happen
  /// an unexpected behavior of snapping.
  ///
  /// - Returns: A View, set as a snap target.
  func snapID<ID>(_ id: ID) -> some View where ID: Hashable {
    self.modifier(SnapIDModifier(id: id))
  }
}
