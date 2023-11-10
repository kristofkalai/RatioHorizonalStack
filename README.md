# RatioHorizonalStack
Split a HStack into separate distinct parts! 🚥

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/RatioHorizonalStack", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

```swift
RatioHorizonalStack {
    Color.red
        .frame(height: 50)
} trailing: {
    Color.blue
        .frame(height: 100)
}
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/RatioHorizonalStack/blob/main/Resources/screenshot.png?raw=true" width="50%" alt="Example"></p>
