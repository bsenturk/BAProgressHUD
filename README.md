# BAProgressHUD

BAProgressHUD is a progress animation that easy to use displaying on progress.

![](gif/firstStyle.gif) ![](gif/secondStyle.gif) 

First Style             Second Style

## Requirements

* iOS 10.3+

## Installation

```
pod 'BAProgressHUD'
```

## Usage

Import BAProgressHUD

```swift
import BAProgressHUD
```
Show the progress HUD
```swift
let baProgressHUD = BAProgressHUD()
baProgressHUD.show(in: self.view)
```

You can use second style like that
```swift
let baProgressHUD = BAProgressHUD(style: .second)
baProgressHUD.show(in: self.view)
```








