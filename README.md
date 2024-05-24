# Simple example of using SwiftData in UIKit

1. Modify DBController and MockData to yours.
2. Declare DBController class as singleton object.
3. Enjoy!

## Simple usage:
```swift
let dbController = DBController.shared

//insert data
dbController.insertData(data: MockData(title: "Hello world!", body: "Bye world!"))
```
