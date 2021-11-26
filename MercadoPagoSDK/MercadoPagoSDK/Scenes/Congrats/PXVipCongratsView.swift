//
//  PXVipCongratsView.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit
import AndesUI

class PXVipCongratsView: UIView {
    
    var button: AndesButton?
    var label: UILabel?
    
    convenience init(backgroundColor: UIColor?, presenter: PXVipCongratsPresenterInput? = nil) {
        self.init()
        
        _ = self.backgroundColor(backgroundColor)
        
        buildInterface()
        
        bind(presenter)
    }
    
    func buildInterface() {

        label = UILabel()
        
        self.addSubview(label!)
        
        NSLayoutConstraint.activate([
            label!.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            label!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            label!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            label!.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        button = AndesButton(text: "Continuar",
                             hierarchy: .loud,
                             size: .large,
                             icon: nil)
        
        self.addSubview(button!)
        
        NSLayoutConstraint.activate([
            button!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            button!.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            button!.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }
    
    func bind(_ presenter: PXVipCongratsPresenterInput? = nil) {
     
        presenter?.valor?.bind { value in
            self.button?.text = value
        }
        
        presenter?.valor?.bind { value in
            self.label?.text = value
        }
        
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
