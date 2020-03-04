//
//  FCTextField.swift
//  FCTextField
//
//  Created by Fernanda Carvalho on 12/02/20.
//  Copyright © 2020 FernandaCarvalho. All rights reserved.
//

import UIKit

public enum ClearButtonType {
    case iosDefault //native clear button icon
    case simple
    case rounded
    case outlineRounded
    case arrow
    case outlineArrow
    case roundCorner
    case squareCorner
    case custom //user provides the image
}

@IBDesignable 
public class FCTextField: UITextField {
    
    fileprivate var bottomLine = UIView()
    fileprivate var tintedClearImage: UIImage?

    open var customClearButtonImage : UIImage?
    open var clearButtonType : ClearButtonType = .iosDefault
    
    @IBInspectable open var clearButtonAlpha : CGFloat = 0.5
    
    @IBInspectable open var bottomDefaultColor : UIColor = .lightGray {
        didSet {
            self.bottomLine.backgroundColor = self.bottomDefaultColor
        }
    }
    
    @IBInspectable open var bottomActiveColor : UIColor = .darkGray
    
    @IBInspectable open var placeholderColor : UIColor = .lightGray {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor:placeholderColor])
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
    }
    
    //MARK: SETUPS
    
    fileprivate func initView() {
        self.customizeBorder()
        self.customizePlaceholder()
        self.configureEvents()
    }
    
    fileprivate func configureEvents() {
        addTarget(self, action: #selector(self.didBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(self.didEndEditing), for: .editingDidEnd)
    }
    
    fileprivate func customizePlaceholder() {
        self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor:placeholderColor])
    }
    
    fileprivate func customizeBorder() {
        self.borderStyle = .none
        self.layer.borderWidth = 0
        
        self.bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1 , width: self.frame.size.width, height: 1)
        self.bottomLine.backgroundColor = self.bottomDefaultColor
        self.addSubview(self.bottomLine)
    }
    
    fileprivate func customizeClearButton() {
        if clearButtonMode != .never {
            for view in self.subviews {
                if view is UIButton {
                    let button = view as! UIButton
                    
                    switch self.clearButtonType {
                    case .iosDefault:
                        if let image = button.image(for: .highlighted) {
                            if self.tintedClearImage == nil {
                                tintedClearImage = image.withTintColor(self.bottomActiveColor)
                            }
                            button.setImage(self.tintedClearImage, for: .normal)
                            button.setImage(self.tintedClearImage, for: .highlighted)
                            break
                        }
                    case .arrow:
                        if let image = UIImage(named: "arrowClearButton") {
                            self.setImageToClearButton(image: image, button: button)
                            break
                        }
                    case .outlineArrow:
                    if let image = UIImage(named: "outlineArrowClearButton") {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .rounded:
                    if let image = UIImage(named: "roundedClearButton") {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .outlineRounded:
                    if let image = UIImage(named: "outlineRoundedClearButton") {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .roundCorner:
                    if let image = UIImage(named: "roundCornerClearButton") {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .squareCorner:
                    if let image = UIImage(named: "squaredClearButton") {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .simple:
                    if let image = UIImage(named: "simpleClearButton") {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .custom:
                        if let image = self.customClearButtonImage {
                            self.setImageToClearButton(image: image, button: button)
                            break
                        } else {
                            self.clearButtonType = .iosDefault
                            self.customizeClearButton()
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func setImageToClearButton(image: UIImage, button: UIButton) {
        let alphaImage = image.alpha(self.clearButtonAlpha)
        if self.tintedClearImage == nil {
            tintedClearImage = alphaImage.withTintColor(self.bottomActiveColor)
        }
        button.setImage(self.tintedClearImage, for: .normal)
        button.setImage(self.tintedClearImage, for: .highlighted)
    }
    
    //MARK: HANDLERS
    @objc fileprivate func didBeginEditing() {
        self.hideBottomLine()
    }
    
    @objc fileprivate func didEndEditing() {
        self.backToDefaultColor()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if self.isFirstResponder {
            self.customizeClearButton()
        }
    }
    
    
    //MARK: ANIMATIONS
    fileprivate func hideBottomLine() {
        UIView.animate(withDuration: 0.5, animations: {
            self.bottomLine.frame.size.width = 0
            self.bottomLine.center.x = self.frame.width/2
        }) { (true) in
            self.bottomLine.isHidden = true
            self.showBottomLine()
        }
    }
    
    fileprivate func showBottomLine() {
        UIView.animate(withDuration: 0.5, animations: {
            self.bottomLine.center.x = 0
            self.bottomLine.frame.size.width = self.frame.size.width
            self.bottomLine.isHidden = false
        }) { (true) in
            self.changeToActiveColor()
        }
    }
    
    fileprivate func changeToActiveColor() {
        UIView.animate(withDuration: 0.2, animations: {
            self.bottomLine.backgroundColor = self.bottomActiveColor
        })
    }
    
    fileprivate func backToDefaultColor() {
        UIView.animate(withDuration: 0.2, animations: {
            self.bottomLine.backgroundColor = self.bottomDefaultColor
        })
    }
}

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
