# SwingAnimation
[![SPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/)

**SwingAnimation** is a framework allows you to apply smooth transition animations in widgets.

## Example

![Demo](./Demo.gif)


```swift
content.swingAnimation(duration: 8, direction: .horizontal, distance: 100)
```

## Requirements

* iOS 14.0+
* Swift 5.8+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/TopWidgets/SwingAnimation.git", .upToNextMajor(from: "1.0.0"))
]
```

## License

**SwingAnimation** is available under the MIT license. See the LICENSE file for more info.
