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

extension UIView {
    
    static func addAsChildView(_ parentView: UIView, _ newView: UIView) {
        
        if parentView is UIStackView {
            (parentView as? UIStackView)?.addArrangedSubview(newView)
        }
        else {
            newView.translatesAutoresizingMaskIntoConstraints = false
            parentView.addSubview(newView)
        }
    }
    
    // UIView
    
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

    // VStack
    
    func VStack(_ callbackHandler: viewCallbackHandler = nil ) -> UIStackView { return UIStackView.XStackView(self) { callbackHandler?($0) } }
    
    static func XStackView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIStackView {
        
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
    
    // Button
    
    func AndesDefaultButton(_ callbackHandler: viewCallbackHandler = nil ) -> AndesButton? { return UIView.AndesButtonView(self) { callbackHandler?($0) } }
    
    static func AndesButtonView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> AndesButton? {
        
        let newButton = AndesButton(text: "Continuar",
                                 hierarchy: .loud,
                                 size: .large,
                                 icon: nil)
        
        if let parentView = parentView {
            addAsChildView(parentView, newButton)
        }
        
        return newButton
    }
    
}
