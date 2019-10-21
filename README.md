# LeakEyeLib

[![CI Status](https://img.shields.io/travis/zhouxiang/LeakEyeLib.svg?style=flat)](https://travis-ci.org/zhouxiang/LeakEyeLib)
[![Version](https://img.shields.io/cocoapods/v/LeakEyeLib.svg?style=flat)](https://cocoapods.org/pods/LeakEyeLib)
[![License](https://img.shields.io/cocoapods/l/LeakEyeLib.svg?style=flat)](https://cocoapods.org/pods/LeakEyeLib)
[![Platform](https://img.shields.io/cocoapods/p/LeakEyeLib.svg?style=flat)](https://cocoapods.org/pods/LeakEyeLib)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS10+

## Installation

LeakEyeLib is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LeakEyeLib'
```

## Usage
Import the lib:

```swift
import LeakEyeLib
```

Declare an instance variable：

```swift
var eye = LeakEye()
```

Start monitor:

```swift
self.eye.delegate = self
self.eye.start()
```

Implement the delegate:

```swift
func leakEye(leakEye:LeakEye,didCatchLeak object:NSObject) {
    print(object)
}
```

that's all


## Thanks
Thanks for [LeakEye](https://github.com/zixun/LeakEye),LeakEyeLib is inspired by it.


## License

LeakEyeLib is available under the MIT license. See the LICENSE file for more info.
