# ConcaveProgressView
A slightly curved progress view written in SwiftUI.

![Screenshot on an Apple Watch](https://raw.githubusercontent.com/MrAsterisco/ConcaveProgressView/main/preview.png)

## Installation
ConcaveProgressView is available through [Swift Package Manager](https://swift.org/package-manager).

```swift
.package(url: "https://github.com/MrAsterisco/ConcaveProgressView", from: "<see GitHub releases>")
```

### Latest Release
To find out the latest version, look at the Releases tab of this repository.

## Usage
You can use ConcaveProgressView as you would normally use a `ProgressView` with a determinate value.
Styling is supported for changing the foreground and background color, as well as the animation and the
bar stroke style.

```swift
@State private var progress = 0.5

var body: some View {
  ConcaveProgressBar(value: $progress)
    .barStyle(.init(lineWidth: 8, lineCap: .round, lineJoin: .round))
    .foreground(.red)
    .background(.gray)
}
```

## Compatibility
ConcaveProgressView requires **iOS 13.0 or later**, **macOS 10.15 or later**, **watchOS 6.0 or later** and **tvOS 13.0 or later**.

## Contributions
All contributions to expand the library are welcome. Fork the repo, make the changes you want, and open a Pull Request.

If you make changes to the codebase, I am not enforcing a coding style, but I may ask you to make changes based on how the rest of the library is made.

## Status
This library is under **active development**. Even if most of the APIs are pretty straightforward, **they may change in the future**; but you don't have to worry about that, because releases will follow [Semantic Versioning 2.0.0](https://semver.org/).

## License
ConcaveProgressView is distributed under the MIT license. [See LICENSE](https://github.com/MrAsterisco/ConcaveProgressView/blob/master/LICENSE) for details.
