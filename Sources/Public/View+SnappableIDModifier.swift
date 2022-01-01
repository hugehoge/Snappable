import SwiftUI

public extension View {
  func snapID<ID>(_ id: ID) -> some View where ID: Hashable {
    self.modifier(SnapIDModifier(id: id))
  }
}
