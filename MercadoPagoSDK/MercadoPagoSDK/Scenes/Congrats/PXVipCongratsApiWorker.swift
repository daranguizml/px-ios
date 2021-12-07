//
//  PXVipCongratsApiWorker.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipCongratsApiWorkerInput: AnyObject {
    var interactor: PXVipCongratsApiWorkerOutput? {get set}
}

protocol PXVipCongratsApiWorkerOutput: AnyObject {
    
}

class PXVipCongratsApiWorker: PXVipCongratsApiWorkerInput {

    weak var interactor: PXVipCongratsApiWorkerOutput?
    
    convenience init(_ interactor: PXVipCongratsApiWorkerOutput?) {
        self.init()
        
        self.interactor = interactor
    }
}
