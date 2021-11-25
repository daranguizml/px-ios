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
}

class PXVipCongratsPresenter: PXVipCongratsPresenterInput {
    
    weak var viewController: PXVipCongratsViewControllerOutput?
    
    convenience init(_ viewController: PXVipCongratsViewControllerOutput?) {
        self.init()
        self.viewController = viewController
    }
}
