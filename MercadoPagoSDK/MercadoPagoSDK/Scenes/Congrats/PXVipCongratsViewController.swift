//
//  PXVipCongratsViewController.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipCongratsViewControllerInput: AnyObject {
  
}

protocol PXVipCongratsViewControllerOutput: AnyObject {
    
}

class PXVipCongratsViewController: UIViewController {

    var router: PXVipCongratsRouterInput?
    var interactor: PXVipCongratsApiWorkerOutput?
    var presenter: PXVipCongratsPresenterInput?
    var apiWorker: PXVipCongratsApiWorkerInput?
    
    override func loadView() {
        self.view = PXVipCongratsView(backgroundColor: .white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        router = PXVipCongratsRouter(self)
        presenter = PXVipCongratsPresenter(self)
        interactor = PXVipCongratsInteractor(presenter, apiWorker)
        apiWorker = PXVipCongratsApiWorker(interactor)
    }
}

extension PXVipCongratsViewController: PXVipCongratsViewControllerOutput {
    
}
