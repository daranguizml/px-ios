//
//  PXVipOneTapView.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

class PXVipOneTapView: UIView {
    
    var bottomView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildInterface()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        buildInterface()
    }
    
    func buildInterface() {
        
        self.bottomView = UIView()
        self.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            bottomView!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView!.topAnchor.constraint(equalTo: self.topAnchor),
            bottomView!.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
