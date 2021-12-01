//
//  PXVipCongratsView.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit
import AndesUI
import AVFoundation

class PXVipCongratsView: UIView {
    
    var button: AndesButton?
    var label: UILabel?
    
    convenience init(backgroundColor: UIColor?, presenter: PXVipCongratsPresenterInput? = nil) {
        self.init()
        
        _ = self.backgroundColor(backgroundColor)
        
        buildInterface2()
        
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
    
    
    func buildInterface2() {
        
        let topBar = View {
            _ = $0
        }.topConstraint(constant: 0)
         .leadingConstraint(constant: 0)
         .trailingConstraint(constant: 0)
         .dimensionConstraints(height: 256)
         .backgroundColor(.green)
        

        
        let bottomArea = View {
            
            _ = $0?.AndesDefaultButton {
                _ = $0
            }.setAction(.touchUpInside) {
                print("foi hein?")
            }
             .leadingConstraint(constant: 16)
             .trailingConstraint(constant: 16)
             .bottomConstraint(constant: 16)
            
        }.bottomConstraint(constant: 16)
         .leadingConstraint(constant: 0)
         .trailingConstraint(constant: 0)
         .dimensionConstraints(height: 128)
        
        let contentArea = View {
            
            _ = $0?.VStack {
                
                _ = $0?.View {
                   _ = $0
                }.backgroundColor(.red)
                 .dimensionConstraints(height: 16)
                
                _ = $0?.View {
                    _ = $0
                }.backgroundColor(.orange)
                 .dimensionConstraints(height: 32)
                
                _ = $0?.View {
                    _ = $0
                }.backgroundColor(.lightGray)
            }
             .topConstraint(constant: 0)
             .leadingConstraint(constant: 0)
             .trailingConstraint(constant: 0)
             .bottomConstraint(constant: 0)
             .backgroundColor(.blue)
                
        }.backgroundColor(.white)
            .topConstraint(relatedView: topBar, relatedTo: .bottom, constant: 0)
         .leadingConstraint(constant: 0)
         .trailingConstraint(constant: 0)
         .bottomConstraint(relatedView: bottomArea, relatedTo: .top, constant: 0)
    }
}
