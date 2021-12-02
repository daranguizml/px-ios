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
        
        router = PXVipCongratsRouter(self)
        presenter = PXVipCongratsPresenter(self)
        interactor = PXVipCongratsInteractor(presenter, apiWorker)
        apiWorker = PXVipCongratsApiWorker(interactor)
        
        self.view = PXVipCongratsView(backgroundColor: .white, presenter: presenter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        presenter?.apiReturn()
    }
}

extension PXVipCongratsViewController: PXVipCongratsViewControllerOutput {
    
}
