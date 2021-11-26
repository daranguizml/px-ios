//
//  Bindable.swift
//  MercadoPagoSDK
//
//  Created by Ricardo Couto D Alambert on 26/11/21.
//  Copyright © 2021 MercadoPago. All rights reserved.
//

import UIKit

class Bindable<T> {
    
    typealias bindableHandler = (_ value: T) -> Void
    
    var value: T {
        didSet {
            executeBinds()
        }
    }
    
    private var handlers: Array<bindableHandler>? = []
    
    func bind(_ handler: @escaping bindableHandler) {
        handlers?.append(handler)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private func executeBinds() {
        for handler in handlers ?? [] {
            handler(value)
        }
    }
}
