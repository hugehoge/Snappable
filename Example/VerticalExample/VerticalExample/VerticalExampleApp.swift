import SwiftUI

@main
struct VerticalExampleApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
          .navigationTitle("Vertical Example")
          .navigationBarTitleDisplayMode(.inline)
      }
    }
  }
}
