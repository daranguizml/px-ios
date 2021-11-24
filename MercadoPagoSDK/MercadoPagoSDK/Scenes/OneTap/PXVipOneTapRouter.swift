//
//  PXVipOneTapRouter.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapRouterInput: class {
    var viewController: PXVipOneTapViewController? {get set}
}

class PXVipOneTapRouter: PXVipOneTapRouterInput {

    weak var viewController: PXVipOneTapViewController?

    convenience init(_ viewController: PXVipOneTapViewController?) {
        self.init()
        self.viewController = viewController
    }
}
