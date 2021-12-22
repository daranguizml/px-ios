//
//  MercadoPagoCheckout+NotificationManager.swift
//  MercadoPagoSDKV4
//
//  Created by Ricardo Grajales Duque on 22/12/21.
//

import Foundation

extension MercadoPagoCheckout {
    public enum PostPayment {
        public typealias ResultBlock = (PXBasePayment?) -> Void
        public typealias CompletionBlock = (@escaping ResultBlock) -> Void
    }

    public enum NotificationCenter {
        static let `default` = Foundation.NotificationCenter()

        public enum SubscribeTo {}
        public enum UnsubscribeTo {}
        internal enum PublishTo {}
    }
}

public extension MercadoPagoCheckout.NotificationCenter.SubscribeTo {
    static func postPaymentAction
    (
        forName name: NSNotification.Name,
        using block: @escaping MercadoPagoCheckout.PostPayment.CompletionBlock
    ) -> NSObjectProtocol {
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main) {
            let resultBlock = $0.object as! MercadoPagoCheckout.PostPayment.ResultBlock
            block(resultBlock)
        }
    }
}

internal extension MercadoPagoCheckout.NotificationCenter.PublishTo {
    static func postPaymentAction(
        withName aName: Notification.Name,
        result: @escaping MercadoPagoCheckout.PostPayment.ResultBlock
    ) {
        NotificationCenter.default.post(name: aName, object: result, userInfo: nil)
    }
}

public extension MercadoPagoCheckout.NotificationCenter.UnsubscribeTo {
    static func postPaymentAction(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
}
