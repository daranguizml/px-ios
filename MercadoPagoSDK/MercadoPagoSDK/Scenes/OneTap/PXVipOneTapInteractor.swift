//
//  PXVipOneTapInteractor.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapInteractorInput: class {
    var presenter: PXVipOneTapPresenterInput? {get set}
    var apiWorker: PXVipOneTapApiWorkerInput? {get set}
}

class PXVipOneTapInteractor: PXVipOneTapInteractorInput {
    
    weak var presenter: PXVipOneTapPresenterInput?
    weak var apiWorker: PXVipOneTapApiWorkerInput?
    
    convenience init(_ presenter: PXVipOneTapPresenterInput?, _ apiWorker: PXVipOneTapApiWorkerInput?) {
        self.init()
        self.presenter = presenter
        self.apiWorker = apiWorker
    }
}

extension PXVipOneTapInteractor: PXVipOneTapApiWorkerOutput {
    
}
