//
//  PXPayerPaymentMethodDisplayInfo.swift
//  MercadoPagoSDKV4
//
//  Created by Gisela Araceli Ramos Carrasco on 10/01/2022.
//

import Foundation

open class PXPayerPaymentMethodDisplayInfo: NSObject, Codable {
    let result: PXDisplayInfoResult
}

open class PXDisplayInfoResult: NSObject, Codable {
    let paymentMethod: PXDisplayInfoPaymentMethod
    
    enum CodingKeys: String, CodingKey {
        case paymentMethod = "payment_method"
    }
}

open class PXDisplayInfoPaymentMethod: NSObject, Codable {
    let iconUrl: String?
    let detail: [PXText]?
    
    enum CodingKeys: String, CodingKey {
        case iconUrl = "icon_url"
        case detail
    }
}


