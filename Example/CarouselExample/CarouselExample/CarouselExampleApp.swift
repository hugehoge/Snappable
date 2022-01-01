import SwiftUI

@main
struct CarouselExampleApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
          .navigationTitle("Carousel Example")
          .navigationBarTitleDisplayMode(.inline)
      }
    }
  }
}
