import SwiftUI

import Snappable

struct ContentView: View {
  var body: some View {
    GeometryReader { proxy in
      List {
        Section {
          VStack(alignment: .leading) {
            Text("ceter aligned")
              .font(.caption)
            CarouselView(
              itemSize: CGSize(width: 240, height: 135),
              itemCount: 30,
              snapAlignment: .center,
              snapMode: .immediately
            )
          }
          VStack(alignment: .leading) {
            Text("leading aligned")
              .font(.caption)
            CarouselView(
              itemSize: CGSize(width: 240, height: 135),
              itemCount: 30,
              snapAlignment: .leading,
              snapMode: .immediately
            )
          }
        } header: {
          Text("Fixed size")
        }
        Section {
          VStack(alignment: .leading) {
            Text(".afterScrolling(decelerationRate: .normal)")
              .font(.caption)
            MultiWidthCarouselView(
              itemHeight: 200,
              itemCount: 30,
              snapAlignment: .center,
              snapMode: .afterScrolling(decelerationRate: .normal)
            )
          }
        } header: {
          Text("Multi Size")
        }
        Section {
          VStack(alignment: .leading) {
            Text("padding 16")
              .font(.caption)
              .padding([.top, .bottom], 4)
              .padding([.leading, .trailing], 16)
            CarouselView(
              itemSize: CGSize(width: proxy.size.width - 32, height: 200),
              itemCount: 30,
              snapAlignment: .center,
              snapMode: .immediately
            )
          }
          .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 8, trailing: 0))
        } header: {
          Text("Screen width")
        }
        Section {
          VStack(alignment: .leading) {
            Text(".afterScrolling(decelerationRate: .normal)")
              .font(.caption)
            CarouselView(
              itemSize: CGSize(width: 64, height: 64),
              itemCount: 100,
              snapAlignment: .center,
              snapMode: .afterScrolling(decelerationRate: .normal)
            )
          }
          VStack(alignment: .leading) {
            Text(".afterScrolling(decelerationRate: .fast)")
              .font(.caption)
            CarouselView(
              itemSize: CGSize(width: 64, height: 64),
              itemCount: 100,
              snapAlignment: .center,
              snapMode: .afterScrolling(decelerationRate: .fast)
            )
          }
        } header: {
          Text("Tiny size")
        }
      }
      .listStyle(.plain)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
