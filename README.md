Snappable
===

A set of SwiftUI custom modifiers to make the ScrollView snappable.

## Demo

<details>
<summary><b>Carousel</b></summary>
<img src="./assets/images/demo_carousel.gif">
</details>

<details>
<summary><b>Vertical (.bottom alligned)</b></summary>
<img src="./assets/images/demo_vertical.gif">
</details>

## Requirements

### OS

- iOS 14.0+

### Note

**Snappable depends on [Introspect for SwiftUI](https://github.com/siteline/SwiftUI-Introspect) due to detect the behavior of scrolling from UIScrollView, so this is fragile on iOS oe SwiftUI upates.**

## Installation

### Swift Package Manager

```swift
.package(
  url: "https://github.com/hugehoge/Snappable.git",
  branch: "main"
)
```

## Usage

### Basic

```swift
struct ContentView: View {
  @State private var items: [Item]

  var body: some View {
    ScrollView(.horiaontal) {
      LazyHStack {
        ForEach(items, id: \.self) { item in
          ItemView(item)
            .snapID(item)  // Step 1
        }
      }
    }
    .snappable()  // Step 2
  }
}
```

1. Added `snapID(_:)` modifier to items in ScrollView
    - **`snapID` applies [.id(_:)](https://developer.apple.com/documentation/swiftui/view/id(_:)) modifier internally**
1. Added `snappable(_:mode:)` modifier to ScrollView

### Options
#### Alignment

The snap anchor point can be set as an option.

```swift
.snappable(.leading)
```

Available parameters are below:

- `.top`
- `.leading`
- `.center`
- `.trailing`
- `.bottom`

#### SnapMode

You can determine the snap timing after the end of the drag with following parameters.

- `.afterScrolling`
- `.immediately`

Both parameters are set together with scrolling deceleration rate.

```swift
.snappable(.center, mode: .afterScolling(decelerationRate: .fast))
```

```swift
.snappable(.center, mode: .immediately(decelerationRate: .normal, withFlick: false))
```
