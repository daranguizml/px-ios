//
//  PXVipOneTapRouter.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapRouterProtocol: class {
    var viewController: PXVipOneTapViewController? {get set}
}

class PXVipOneTapRouter: PXVipOneTapRouterProtocol {

    weak var viewController: PXVipOneTapViewController?

    convenience init(_ viewController: PXVipOneTapViewController?) {
        self.init()
        self.viewController = viewController
    }
}
