import SwiftUI

typealias PlatformView = UIView

/// Utility methods to inspect the UIKit view hierarchy.
enum Introspect {
  /// Finds a previous sibling that is of the specified type.
  /// This method inspects siblings recursively.
  /// Returns nil if no sibling contains the specified type.
  static func previousSibling<AnyViewType: PlatformView>(
    ofType type: AnyViewType.Type,
    from entry: PlatformView
  ) -> AnyViewType? {

    guard let superview = entry.superview,
          let entryIndex = superview.subviews.firstIndex(of: entry),
          entryIndex > 0
    else {
      return nil
    }

    for subview in superview.subviews[0..<entryIndex].reversed() {
      if let typed = subview as? AnyViewType {
        return typed
      }
    }

    return nil
  }

  /// Finds an ancestor of the specified type.
  /// If it reaches the top of the view without finding the specified view type, it returns nil.
  static func findAncestor<AnyViewType: PlatformView>(ofType type: AnyViewType.Type, from entry: PlatformView) -> AnyViewType? {
    var superview = entry.superview
    while let s = superview {
      if let typed = s as? AnyViewType {
        return typed
      }
      superview = s.superview
    }
    return nil
  }

  /// Finds the view host of a specific view.
  /// SwiftUI wraps each UIView within a ViewHost, then within a HostingView.
  /// Returns nil if it couldn't find a view host. This should never happen when called with an IntrospectionView.
  static func findViewHost(from entry: PlatformView) -> PlatformView? {
    var superview = entry.superview
    while let s = superview {
      if NSStringFromClass(type(of: s)).contains("ViewHost") {
        return s
      }
      superview = s.superview
    }
    return nil
  }
}

enum TargetViewSelector {
  static func siblingOfType<TargetView: PlatformView>(from entry: PlatformView) -> TargetView? {
    guard let viewHost = Introspect.findViewHost(from: entry) else {
      return nil
    }
    return Introspect.previousSibling(ofType: TargetView.self, from: viewHost)
  }

  static func siblingOfTypeOrAncestor<TargetView: PlatformView>(from entry: PlatformView) -> TargetView? {
    if let sibling: TargetView = siblingOfType(from: entry) {
      return sibling
    }
    return Introspect.findAncestor(ofType: TargetView.self, from: entry)
  }
}

/// Allows to safely access an array element by index
/// Usage: array[safe: 2]
private extension Array {
  subscript(safe index: Int) -> Element? {
    guard index >= 0, index < endIndex else {
      return nil
    }

    return self[index]
  }
}
