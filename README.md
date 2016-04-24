# BSNotification

[![CI Status](http://img.shields.io/travis/Bobby Stenly/BSNotification.svg?style=flat)](https://travis-ci.org/Bobby Stenly/BSNotification)
[![Version](https://img.shields.io/cocoapods/v/BSNotification.svg?style=flat)](http://cocoapods.org/pods/BSNotification)
[![License](https://img.shields.io/cocoapods/l/BSNotification.svg?style=flat)](http://cocoapods.org/pods/BSNotification)
[![Platform](https://img.shields.io/cocoapods/p/BSNotification.svg?style=flat)](http://cocoapods.org/pods/BSNotification)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

BSNotification is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BSNotification"
```

## How to Use

To use this library, you need to add `import BSNotification` in the top of your view controller. Then you can show a pop up notification by running the following code : 

```swift
BSNotification.show("Hello World!", viewController: self)
```

There are 2 options for showing a pop up notification. First, you can show it at the bottom (default), or you can show it at the top. If you want to show it at the top of your view controller, you can call the show function like bellow :

```swift
BSNotification.show("Hello World!", viewController: self, position: .Top)
```


## Author

Bobby Stenly, iceman.bsi@gmail.com

## License

BSNotification is available under the MIT license. See the LICENSE file for more info.
