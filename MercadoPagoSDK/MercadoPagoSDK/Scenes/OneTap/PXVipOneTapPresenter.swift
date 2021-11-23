//
//  PXVipOneTapPresenter.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapPresenterProtocol: class {
    var delegate: PXVipOneTapPresenterDelegate? {get set}
}

protocol PXVipOneTapPresenterDelegate: class {
    
}

class PXVipOneTapPresenter: PXVipOneTapPresenterProtocol {
    
    weak var delegate: PXVipOneTapPresenterDelegate?
    
    convenience init(_ delegate: PXVipOneTapPresenterDelegate?) {
        self.init()
        self.delegate = delegate
    }
}
