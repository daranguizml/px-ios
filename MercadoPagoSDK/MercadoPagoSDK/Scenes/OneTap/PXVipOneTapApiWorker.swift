//
//  PXVipOneTapApiWorker.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapApiWorkerInput: class {
    var interactor: PXVipOneTapApiWorkerOutput? {get set}
}

protocol PXVipOneTapApiWorkerOutput: class {
    
}

class PXVipOneTapApiWorker: PXVipOneTapApiWorkerInput {

    weak var interactor: PXVipOneTapApiWorkerOutput?
    
    convenience init(_ interactor: PXVipOneTapApiWorkerOutput?) {
        self.init()
        
        self.interactor = interactor
    }
}
