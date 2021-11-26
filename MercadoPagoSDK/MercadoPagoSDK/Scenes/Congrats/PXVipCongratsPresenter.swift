//
//  PXVipCongratsPresenter.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipCongratsPresenterInput: class {
    var viewController: PXVipCongratsViewControllerOutput? {get set}
    var valor: Bindable<String>? {get set}
    
    func apiReturn()
}

class PXVipCongratsPresenter: PXVipCongratsPresenterInput {
    
    weak var viewController: PXVipCongratsViewControllerOutput?
    
    var valor: Bindable<String>? = Bindable<String>(String())
    
    convenience init(_ viewController: PXVipCongratsViewControllerOutput?) {
        self.init()
        self.viewController = viewController
        
        
    }
    
    func apiReturn() {
        valor?.value = "Oi esse sou eu"
    }
}
