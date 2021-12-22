//
//  PXPostPaymentConfiguration.swift
//  MercadoPagoSDKV4
//
//  Created by Ricardo Grajales Duque on 22/12/21.
//

import Foundation

/**
 Post payment configuration provides you support for being called in you own flow before showing the congrats screen and then go back to the PX flow.
 */
@objcMembers
open class PXPostPaymentConfiguration: NSObject {
    /**
     The notification name that you will be using for post payment capability
     */
    open var postPaymentNotificationName: Notification.Name?
}
