//
//  PXVipOneTapViewController.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

protocol PXVipOneTapViewControllerInput: AnyObject {
  
}

protocol PXVipOneTapViewControllerOutput: AnyObject {
    
}

class PXVipOneTapViewController: UIViewController {

    var router: PXVipOneTapRouterInput?
    var interactor: PXVipOneTapInteractorInput?
    var presenter: PXVipOneTapPresenterInput?
    var apiWorker: PXVipOneTapApiWorkerInput?
    
    override func loadView() {
        self.view = PXVipOneTapView(backgroundColor: .white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        router = PXVipOneTapRouter(self)
        presenter = PXVipOneTapPresenter(self)
        interactor = PXVipOneTapInteractor(presenter, apiWorker)
    }
}

extension PXVipOneTapViewController: PXVipOneTapViewControllerOutput {
    
}
