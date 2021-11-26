//
//  PXVipCongratsView.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit
import AndesUI

typealias viewCallbackHandler = ((_ parentView: UIView?) -> Void)?

extension UIView {
    
    func View(_ callbackHandler: viewCallbackHandler = nil ) -> UIView { return UIView.XView(self) { callbackHandler?($0) } }
    
    static func XView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIView {
        
        let newView = UIView()
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        
        parentView?.addSubview(newView)
        
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
    
    func topConstraint(relatedView: UIView? = nil, constant: CGFloat) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: workView.topAnchor, constant: constant)
        ])
        
        return self
    }
    
    func leftConstraint(relatedView: UIView? = nil, constant: CGFloat) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: workView.leftAnchor, constant: constant)
        ])
        
        return self
    }
    
    func rightConstraint(relatedView: UIView? = nil, constant: CGFloat) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        NSLayoutConstraint.activate([
            self.rightAnchor.constraint(equalTo: workView.rightAnchor, constant: -constant)
        ])
        
        return self
    }
    
    func bottomConstraint(relatedView: UIView? = nil, constant: CGFloat) -> UIView {
        
        guard let workView = (relatedView != nil ? relatedView : self.superview) else { return self }
        
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: workView.bottomAnchor, constant: -constant)
        ])
        
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
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: defaultConstant ?? 0.0),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: defaultConstant ?? 0.0),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: defaultConstant ?? 0.0),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: defaultConstant ?? 0.0)
        ])
        
        return self
    }
}

extension UIStackView {
    
    func VStack(_ callbackHandler: viewCallbackHandler = nil ) -> UIStackView { return UIStackView.XStackView(self) { callbackHandler?($0) } }
    
    static func XStackView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIStackView {
        
        let newView = UIStackView()
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        
        parentView?.addSubview(newView)
        
        handler?(newView)
        
        return newView
    }
    
}

class PXVipCongratsView: UIView {
    
    convenience init(backgroundColor: UIColor?) {
        self.init()
        
        _ = self.backgroundColor(backgroundColor)
        
        buildInterface()
    }
    
    func buildInterface() {
        
        
        
        let button = AndesButton(text: "Continuar",
                                 hierarchy: .loud,
                                 size: .large,
                                 icon: nil)
        
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }
    
    /*
    func buildInterface() {
        
        _ = View {
            
            _ = $0?.View {
                
                _ = $0?.View { _ in
                
                }.backgroundColor(.red)
                 .paddingConstraints(top: 4, left: 4, right: 4, bottom: 4)
                
            }
             .backgroundColor(.green)
             .dimensionConstraints(height: 48)
             .paddingConstraints(left: 16, right: 16, bottom: 16)
            
                _ = $0?.View()
                .backgroundColor(.pxOrangeMp)
                .dimensionConstraints(height: 256)
                .leftConstraint(relatedView: <#T##UIView?#>, constant: <#T##CGFloat#>)
                
        
        }.position(x: 0, y: 0, width: 256, height: 512)
         .backgroundColor(.gray)
         .defaultConstraints()
    }*/
}
