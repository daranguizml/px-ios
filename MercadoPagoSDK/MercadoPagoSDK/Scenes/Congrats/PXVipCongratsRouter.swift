//
//  PXVipCongratsRouter.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipCongratsRouterInput: class {
    var viewController: PXVipCongratsViewController? {get set}
}

class PXVipCongratsRouter: PXVipCongratsRouterInput {

    weak var viewController: PXVipCongratsViewController?

    convenience init(_ viewController: PXVipCongratsViewController?) {
        self.init()
        self.viewController = viewController
    }
}
