# FCText-field


A custom UITextField with animations on 'didBeginEditing' and 'didEndEditing' events. 
It provides some icons for textfield's clearButton and support for your custom icon.
This is written in Swift.

____________________________

![alt text](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/fctextfield.gif)

____________________________

## Features

- Custom placeholder color in IB or programmatically
- Custom borderBottom color for default state and active state in IB or programmatically
- Custom clearButton alpha in IB or programmatically
- Custom clearButton icon

____________________________

## Installation 

You can use Cocoapods to install FCTextField by adding it to your Podfile:

```javascript
use_frameworks!
pod 'FCTextField'
```

And then import FCTextField:

```javascript
import FCTextField
```
____________________________

## Usage

1. Open a storyboard or Xib file.
2. Drag and drop a UITextField to a ViewController.
3. In Identity Inspector, replace the class from UITextField to FCTextField.
4. Configure properties in the Attribute Inspector

  If you want to show clearButton:

5. Change 'Clear Button' property from 'Never appears' to 'Appears while editing'
6. Create an IBOutlet in your class and set 'clearButtonType' property. You can choose between:
    - iosDefault (native icon)
    - simple ![](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/simpleClearButton.png)
    - rounded ![](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/roundedClearButton.png)
    - outlineRounded ![](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/outlineRoundedClearButton.png)
    - arrow  ![](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/arrowClearButton.png)
    - outlineArrow ![](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/outlineArrowClearButton.png)
    - roundCorner ![](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/roundCornerClearButton.png)
    - squareCorner ![](https://github.com/fernandacarvalho/FCText-field/blob/master/assets/squaredClearButton.png)
    - custom (user provides the image)
    
   Ex: myTextField.clearButtonType = .outlineRounded
   
7. Choose the color and the alpha of the clearButton

  If you choose ClearButtonType.custom:

8. Set your image.
   Ex: myTextField.customClearButtonImage = yourImage
   
* If the type isn't chosen, the .iosDefault will be applied and the ios native icon for clear button will appear.
* If the type chosen is .custom but the image isn't provided, the ios native icon for clear button will appear.
* You can see the usage in the ExampleApp

