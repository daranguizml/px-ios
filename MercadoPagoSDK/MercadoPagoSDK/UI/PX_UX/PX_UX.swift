//
//  PX_UX.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit
import AndesUI

typealias viewCallbackHandler = ((_ parentView: UIView?) -> Void)?
typealias actionCallbackHandler = () -> ()

/// Target-Action helper.
final class Action: NSObject {

    private var _action: actionCallbackHandler?

    init(_ action: actionCallbackHandler?) {
        _action = action
        super.init()
    }
    
    deinit {
        _action = nil
    }

    @objc func action() {
        _action?()
    }
}

extension UIView {
    
    private struct actionHolder {
        static var _actionComputedProperty = [String: Action]()
    }
        
    var viewInteractAction: Action? {
        get {
            return actionHolder._actionComputedProperty["\(Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque())"]
        }
        set(newValue) {
            actionHolder._actionComputedProperty["\(Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque())"] = newValue
        }
    }
    
    func deInit() {
        self.viewInteractAction = nil
    }
    
    @objc func executeInteractAction() {
        self.viewInteractAction?.action()
    }
    
    static func addAsChildView(_ parentView: UIView, _ newView: UIView) {
        
        if parentView is UIStackView {
            (parentView as? UIStackView)?.addArrangedSubview(newView)
        }
        else {
            newView.translatesAutoresizingMaskIntoConstraints = false
            parentView.addSubview(newView)
        }
    }
    
    // UIView semantic methods
    
    func View(_ callbackHandler: viewCallbackHandler = nil ) -> UIView { return UIView.XView(self) { callbackHandler?($0) } }
    
    static func XView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIView {
        
        let newView = UIView()
        
        if let parentView = parentView {
            addAsChildView(parentView, newView)
        }
        
        handler?(newView)
        
        return newView
    }
    
    func position(x: Int, y: Int, width: Int, height: Int) -> UIView {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
    
    func backgroundColor(_ color: UIColor?) -> UIView {
        _ = self.backgroundColor = color
        return self
    }
    
    func dimensionConstraints(width: CGFloat? = nil, height: CGFloat? = nil) -> UIView {
        
        var constraints: [NSLayoutConstraint] = []
        
        if let width = width {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width))
        }
        
        if let height = height {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height))
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return self
    }
    
    func topConstraint(relatedView: UIView? = nil, relatedTo: NSLayoutConstraint.Attribute? = nil, constant: CGFloat? = nil) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
                                                                attribute: NSLayoutConstraint.Attribute.top,
                                                                relatedBy: NSLayoutConstraint.Relation.equal,
                                                                toItem: workView,
                                                                attribute: relatedTo ?? NSLayoutConstraint.Attribute.top,
                                                                multiplier: 1,
                                                                constant: constant ?? 0.0)
        NSLayoutConstraint.activate([constraint])
        
        return self
    }
    
    func leadingConstraint(relatedView: UIView? = nil, relatedTo: NSLayoutConstraint.Attribute? = nil, constant: CGFloat? = nil) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
                                                                attribute: NSLayoutConstraint.Attribute.leading,
                                                                relatedBy: NSLayoutConstraint.Relation.equal,
                                                                toItem: workView,
                                                                attribute: relatedTo ?? NSLayoutConstraint.Attribute.leading,
                                                                multiplier: 1,
                                                                constant: constant ?? 0.0)
        NSLayoutConstraint.activate([constraint])
        
        return self
    }
    
    func trailingConstraint(relatedView: UIView? = nil, relatedTo: NSLayoutConstraint.Attribute? = nil, constant: CGFloat? = nil) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
                                                                attribute: NSLayoutConstraint.Attribute.trailing,
                                                                relatedBy: NSLayoutConstraint.Relation.equal,
                                                                toItem: workView,
                                                                attribute: relatedTo ?? NSLayoutConstraint.Attribute.trailing,
                                                                multiplier: 1,
                                                                constant: -(constant ?? 0.0))
        NSLayoutConstraint.activate([constraint])
        
        return self
    }
    
    func bottomConstraint(relatedView: UIView? = nil, relatedTo: NSLayoutConstraint.Attribute? = nil, constant: CGFloat? = nil) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
                                                                attribute: NSLayoutConstraint.Attribute.bottom,
                                                                relatedBy: NSLayoutConstraint.Relation.equal,
                                                                toItem: workView,
                                                                attribute: relatedTo ?? NSLayoutConstraint.Attribute.bottom,
                                                                multiplier: 1,
                                                                constant: -(constant ?? 0.0))
        NSLayoutConstraint.activate([constraint])
        
        return self
    }
    
    func paddingConstraints(top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) -> UIView {
        
        guard let superview = self.superview else { return self }
        
        var constraints: [NSLayoutConstraint] = []
        
        if let top = top {
            constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top))
        }
        
        if let left = left {
            constraints.append(self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: left))
        }
        
        if let right = right {
            constraints.append(self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -right))
        }
        
        if let bottom = bottom {
            constraints.append(self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom))
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return self
    }
    
    func relatedConstraint(relatedView: UIView? = nil,
                           thisConstraint: NSLayoutConstraint.Attribute? = nil,
                           relatedTo: NSLayoutConstraint.Attribute? = nil,
                           relatedBy: NSLayoutConstraint.Relation? = nil,
                           multiplier: CGFloat? = nil,
                           constant: CGFloat? = nil) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
                                                                attribute: thisConstraint ?? NSLayoutConstraint.Attribute.top,
                                                                relatedBy: relatedBy ?? NSLayoutConstraint.Relation.equal,
                                                                toItem: workView,
                                                                attribute: relatedTo ?? NSLayoutConstraint.Attribute.top,
                                                                multiplier: multiplier ?? 1.0,
                                                                constant: constant ?? 0.0)
        NSLayoutConstraint.activate([constraint])
        
        
        return self
    }
    
    func defaultConstraints(defaultConstant: CGFloat? = nil) -> UIView {
        
        guard let superview = self.superview else { return self }
        
        let constant = defaultConstant ?? 0.0
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: constant),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: -constant),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant)
        ])
        
        return self
    }
}

extension UIView {
    
    // VStack semantic methods
    
    func VStack(_ callbackHandler: viewCallbackHandler = nil ) -> UIStackView { return UIStackView.XVerticalStackView(self) { callbackHandler?($0) } }
    
    static func XVerticalStackView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIStackView {
        
        let newView = UIStackView()
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.axis = .vertical
        newView.distribution = .fill
        newView.alignment = .fill
        newView.spacing = 0
        
        parentView?.addSubview(newView)
        
        handler?(newView)
        
        return newView
    }
    
    // HStack
    func HStack(_ callbackHandler: viewCallbackHandler = nil ) -> UIStackView { return UIStackView.XHorizontalStackView(self) { callbackHandler?($0) } }
    
    static func XHorizontalStackView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIStackView {
        
        let newView = UIStackView()
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.axis = .horizontal
        newView.distribution = .fill
        newView.alignment = .fill
        newView.spacing = 0
        
        parentView?.addSubview(newView)
        
        handler?(newView)
        
        return newView
    }
}

extension UIView {

    // Button semantic methods
    
    func DefaultButton(_ callbackHandler: viewCallbackHandler = nil) -> UIButton { return UIView.XButtonView(self) { callbackHandler?($0) } }
    
    static func XButtonView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIButton {
        
        let newButton = UIButton(type: .custom)
        
        newButton.setTitle("Continuar", for: .normal)
        
        if let parentView = parentView {
            addAsChildView(parentView, newButton)
        }
        
        handler?(newButton)
        
        return newButton
    }
    
    func setButtonImage(_ imagePath: String?) -> UIView {
        
        if self is UIButton, let imagePath = imagePath {
            let instance = self as? UIButton
            instance?.setImage(UIImage(named: imagePath), for: .normal)
        }
        
        return self
    }
    
    func setButtonTitle(_ title: String?) -> UIView {
        
        if let title = title {
            
            if self is UIButton {
                let instance = self as? UIButton
                instance?.setTitle(title, for: .normal)
            } else if self is AndesButton {
                let instance = self as? AndesButton
                instance?.text = title
            }
                        
        }
        
        return self
    }
    
    func setAction(_ event: UIControl.Event, _ actionHandler: actionCallbackHandler? = nil) -> UIView {
        
        self.viewInteractAction = Action(actionHandler)
        
        if self is AndesButton {
            (self as? AndesButton)?.addTarget(self, action: #selector(executeInteractAction), for: event)
        } else if self is UIButton {
            (self as? UIButton)?.addTarget(self, action: #selector(executeInteractAction), for: event)
        }
        
        return self
    }
    
    //AndesButton
    
    func AndesDefaultButton(_ callbackHandler: viewCallbackHandler = nil) -> AndesButton { return UIView.XAndesButtonView(self) { callbackHandler?($0) } }
    
    static func XAndesButtonView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> AndesButton {
        
        let newButton = AndesButton(text: "Continuar",
                                 hierarchy: .loud,
                                 size: .large,
                                 icon: nil)
        
        if let parentView = parentView {
            addAsChildView(parentView, newButton)
        }
        
        handler?(newButton)
        
        return newButton
    }
}

extension UIView {
    
    func Label(_ contentText: String?, _ callbackHandler: viewCallbackHandler = nil) -> UILabel { return UIView.XUILabel(contentText, self) { callbackHandler?($0) } }
    
    static func XUILabel(_ contentText: String?, _ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UILabel {
        
        let newLabel = UILabel()
        
        if let contentText = contentText {
            newLabel.text = contentText
        }
        
        if let parentView = parentView {
            addAsChildView(parentView, newLabel)
        }
        
        handler?(newLabel)

        return newLabel
    }
    
    func fontType(fontName: String? = nil, font: UIFont? = nil, size: CGFloat? = nil) -> UIView {
        
        if self is UILabel {
            
            let instance = self as? UILabel
            
            if let fontName = fontName {
                instance?.font = UIFont(name: fontName, size: size ?? 14.0)
            } else if let font = font {
                instance?.font = font
            }
        }
        
        return self
    }
    
    func fontColor(_ color: UIColor?) -> UIView {
        
        if self is UILabel {
            
            let instance = self as? UILabel
        
            instance?.textColor = color ?? .black
        }
        
        return self
    }
    
    func numberOfLines(_ count: Int?) -> UIView {
        
        if self is UILabel {
            
            let instance = self as? UILabel
        
            instance?.numberOfLines = count ?? 1
        }
        
        return self
    }
}

extension UIView {
    
    // Image semantic methods
    
    func Image(_ imagePath: String?, _ callbackHandler: viewCallbackHandler = nil) -> UIImageView { return UIView.XImageView(imagePath, self) { callbackHandler?($0) } }
    
    static func XImageView(_ imagePath: String?, _ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIImageView {
        
        let newImage = UIImageView(image: UIImage( named: imagePath ?? String(), in: MercadoPagoSDKV4.MercadoPagoBundle.bundle(), compatibleWith: nil))
        
        newImage.contentMode = .scaleAspectFit
        
        if let parentView = parentView {
            addAsChildView(parentView, newImage)
        }
        
        handler?(newImage)

        return newImage
    }
}

extension UIView: UIScrollViewDelegate {
    
    // Scrollview semantic methods
    
    func ScrollView(_ callbackHandler: viewCallbackHandler = nil) -> UIScrollView { return UIView.XScrollView(self) { callbackHandler?($0) } }
    
    static func XScrollView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        scrollView.delegate = scrollView
        
        if let parentView = parentView {
            addAsChildView(parentView, scrollView)
        }
        
        handler?(scrollView)

        return scrollView
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
