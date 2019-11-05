# BAProgressHUD

BAProgressHUD is a progress animation that easy to use displaying on progress.

![](gif/firstStyle.gif) ![](gif/secondStyle.gif) 

First Style             Second Style

# Requirements

• iOS 10.3+

# Installation

```
pod 'BAProgressHUD'

```

# Usage

import BAProgressHUD

```
import BAProgressHUD
```
Show the progress HUD
```
let baProgressHUD = BAProgressHUD()
baProgressHUD.show(in: self.view)
```

You can use second style like that
```
let baProgressHUD = BAProgressHUD(style: .second)
baProgressHUD.show(in: self.view)
```








