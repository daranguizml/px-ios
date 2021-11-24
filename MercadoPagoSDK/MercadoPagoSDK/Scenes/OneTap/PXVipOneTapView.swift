//
//  PXVipOneTapView.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

typealias viewCallbackHandler = ((_ parentView: UIView?) -> Void)?

extension UIView {
    
    func View(_ callbackHandler: viewCallbackHandler = nil ) -> UIView { return UIView.XView(self) { callbackHandler?($0) } }
    
    func ScrollView(_ callbackHandler: viewCallbackHandler = nil ) -> UIScrollView { return UIView.XScrollView(self) { callbackHandler?($0) } }
    
    static func XView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIView {
        
        let newView = UIView()
        
        parentView?.addSubview(newView)
        
        handler?(newView)
        
        return newView
    }
    
    static func XScrollView(_ parentView: UIView? = nil, _ handler: viewCallbackHandler = nil) -> UIScrollView {
        
        let newView = UIScrollView()
        
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
}

class PXVipOneTapView: UIView {
    
    var bottomView: UIView?
    
    convenience init(backgroundColor: UIColor?) {
        self.init()
        _ = self.backgroundColor(backgroundColor)
        
        buildInterface()
    }
    
    func buildInterface() {
        
        _ = ScrollView { s in
            
            _ = s?.View {
                
                _ = $0?.View { _ in
                
                }.position(x: 10, y: 10, width: 40, height: 40)
                 .backgroundColor(.red)
                
            }.position(x: 32, y: 32, width: 128, height: 256)
             .backgroundColor(.green)
        
        }.position(x: 0, y: 0, width: 256, height: 512)
         .backgroundColor(.gray)
        
        
    }
}
