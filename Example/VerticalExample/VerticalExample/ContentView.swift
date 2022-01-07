import SwiftUI

import Snappable

struct ContentView: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0..<100) { index in
          ZStack {
            color(index)
              .frame(height: 64)
            Text(String(index + 1))
          }
          .snapID(index)
        }
      }
    }
    .snappable(
      alignment: .bottom,
      mode: .afterScrolling(decelerationRate: .normal)
    )
  }

  private func color(_ index: Int) -> Color {
    let seed: Int = (index * 73) % 100
    let hue: Double = Double(seed) / 100

    return Color(hue: hue, saturation: 0.5, brightness: 1.0)
  }
}
