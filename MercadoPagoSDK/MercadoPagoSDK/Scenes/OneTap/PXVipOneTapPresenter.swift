//
//  PXVipOneTapPresenter.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapPresenterInput: class {
    var viewController: PXVipOneTapViewControllerOutput? {get set}
}

class PXVipOneTapPresenter: PXVipOneTapPresenterInput {
    
    weak var viewController: PXVipOneTapViewControllerOutput?
    
    convenience init(_ viewController: PXVipOneTapViewControllerOutput?) {
        self.init()
        self.viewController = viewController
    }
}
