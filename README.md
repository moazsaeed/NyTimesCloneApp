# NyTimesCloneApp
This is NyTimesCloneApp
This App fetching the data from https://developer.nytimes.com. and shows the list of Articles in a infinite scrollable tableview. and shows the detail of news API.
Their news detail api is not available so shown max news detail what I received in previous API.

## Demonstrations

Covers the following:

* Discussions
* Screenshots
* Architecture at a Glance
* Requirements
* Architecture
* ThirdParty Libraries
* How to Run
* Tests
* Author 
* Limitations
* License

## Discussions

I have used `UIKit` for user interface creation, `RxSwift` allows me to use features like Observable, Relays, publishers and subscribers. Used `MVVM` Architectural design pattern is for modularized, maintainable and decoupled Codeing, easy to test, Bindings make UI updates easier to handle etc.

## Screenshots

|             Articles List         |         ArticleDetail          | 
|---------------------------------|------------------------------|
|![Demo]()|![Demo]()|

## Architecture at a Glance

![Architecture at a Glance]()

## Requirements

- Xcode 13.1
- Cocoapods 1.11.2
- Swift 5.0
- Minimum iOS version 15.0

## Architecture
1. MVVM (Model View ViewModel)

## ThirdParty Libraries
- RxSwift (for data binding)
- Alamofire (for networking)
- AlamofireImage (for image loading and caching)
- KRProgressHUD (for progress hud while processing in the app)
- XCTest Framework 

## How to Run
- clone the repository or download the zip file
- open terminal and go to project directory
- run command `pod install` to install the dependencies
- Run the project

## Tests
I have added test only for model classes. Because of limitaiton of Time.
To run tests using xcodebuild.

- open xcode
- press keys cmd + U

## Author

moazsaeed, moazsaeed@live.com

## Limitations
API has limitations for number of request. you can create your own api-key on api portal.
How to get the new New York Time API key: Go to https://developer.nytimes.com/ and click on “Request an API key.

## License

Weather-SwiftUI-MVVM is available under the MIT license. See the LICENSE file for more info.


