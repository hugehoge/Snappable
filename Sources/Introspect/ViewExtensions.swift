import SwiftUI
import UIKit

extension View {
  func inject<SomeView>(_ view: SomeView) -> some View where SomeView: View {
    overlay(view.frame(width: 0, height: 0))
  }
}

extension View {
  /// Finds a `TargetView` from a `SwiftUI.View`
  func introspect<TargetView: UIView>(
    selector: @escaping (IntrospectionUIView) -> TargetView?,
    customize: @escaping (TargetView) -> ()
  ) -> some View {
    inject(UIKitIntrospectionView(
      selector: selector,
      customize: customize
    ))
  }

  /// Finds a `UIScrollView` from a `SwiftUI.ScrollView`, or `SwiftUI.ScrollView` child.
  func introspectScrollView(customize: @escaping (UIScrollView) -> ()) -> some View {
    return introspect(selector: TargetViewSelector.siblingOfTypeOrAncestor, customize: customize)
  }
}
