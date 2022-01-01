import SwiftUI

import Snappable

struct CarouselView: View {
  let itemSize: CGSize
  let itemCount: Int
  let snapAlignment: SnapAlignment
  let snapMode: SnapMode

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ForEach(0..<itemCount) { index in
          ZStack {
            color(index)
              .frame(width: itemSize.width, height: itemSize.height)
            Text(String(index + 1))
          }
          .cornerRadius(16)
          .snapID(index)
        }
      }
    }
    .snappable(snapAlignment, mode: snapMode)
  }

  private func color(_ index: Int) -> Color {
    let seed: Int = (index * 13) % 100
    let hue: Double = Double(seed) / 100

    return Color(hue: hue, saturation: 0.5, brightness: 1.0)
  }
}
