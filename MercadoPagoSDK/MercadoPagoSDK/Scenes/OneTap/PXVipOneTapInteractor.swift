//
//  PXVipOneTapInteractor.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapInteractorProtocol: class {
    var presenter: PXVipOneTapPresenterProtocol? {get set}
    var apiWorker: PXVipOneTapApiWorkerProtocol? {get set}
}

class PXVipOneTapInteractor: PXVipOneTapInteractorProtocol {
    
    weak var presenter: PXVipOneTapPresenterProtocol?
    weak var apiWorker: PXVipOneTapApiWorkerProtocol?
    
    convenience init(_ presenter: PXVipOneTapPresenterProtocol?, _ apiWorker: PXVipOneTapApiWorkerProtocol?) {
        self.init()
        self.presenter = presenter
        self.apiWorker = apiWorker
    }
}

extension PXVipOneTapInteractor: PXVipOneTapApiWorkerDelegate {
    
}
