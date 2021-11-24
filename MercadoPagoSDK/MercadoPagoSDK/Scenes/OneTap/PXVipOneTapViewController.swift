//
//  PXVipOneTapViewController.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 23/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

class PXVipOneTapViewController: UIViewController {

    var router: PXVipOneTapRouterProtocol?
    var interactor: PXVipOneTapInteractorProtocol?
    var presenter: PXVipOneTapPresenterProtocol?
    var apiWorker: PXVipOneTapApiWorkerProtocol?
    
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

extension PXVipOneTapViewController: PXVipOneTapPresenterDelegate {
    
}
