//
//  PXVipCongratsInteractor.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipCongratsInteractorInput: class {
    var presenter: PXVipCongratsPresenterInput? {get set}
    var apiWorker: PXVipCongratsApiWorkerInput? {get set}
}

class PXVipCongratsInteractor: PXVipCongratsInteractorInput {
    
    weak var presenter: PXVipCongratsPresenterInput?
    weak var apiWorker: PXVipCongratsApiWorkerInput?
    
    convenience init(_ presenter: PXVipCongratsPresenterInput?, _ apiWorker: PXVipCongratsApiWorkerInput?) {
        self.init()
        self.presenter = presenter
        self.apiWorker = apiWorker
    }
}

extension PXVipCongratsInteractor: PXVipCongratsApiWorkerOutput {
    
}
