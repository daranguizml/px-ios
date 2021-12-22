//
//  CustomPostPaymentProcessor.swift
//  ExampleSwift
//
//  Created by Ricardo Grajales Duque on 21/12/21.
//  Copyright © 2021 Juan Sebastian Sanzone. All rights reserved.
//

import Foundation
import MercadoPagoSDKV4

enum PaymentResultUseCases {
    case approved
    case error
    case warning
}

final class CustomPostPaymentProcessor: NSObject, PXPaymentProcessor {
    private var paymentResultUseCase: PaymentResultUseCases = .approved

    func startPayment(
        checkoutStore: PXCheckoutStore,
        errorHandler: PXPaymentProcessorErrorHandler,
        successWithBusinessResult: @escaping ((PXBusinessResult) -> Void),
        successWithPaymentResult: @escaping ((PXGenericPayment) -> Void)
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: { [self] in
            switch paymentResultUseCase {
            case .approved:
                successWithPaymentResult(approvedGenericPayment())
            case .error:
                successWithPaymentResult(rejectedCCAmountRateLimit())
            case .warning:
                successWithPaymentResult(rejectedCCAmountRateLimit())
            }
        })
    }

    func paymentProcessorViewController() -> UIViewController? {
        return nil
    }

    func support() -> Bool {
        return true
    }

    func approvedGenericPayment () -> PXGenericPayment {
        return PXGenericPayment(paymentStatus: .APPROVED, statusDetail: "Pago aprobado desde procesadora custom!")
    }

    func rejectedCCAmountRateLimit () -> PXGenericPayment {
        return PXGenericPayment(paymentStatus: .REJECTED, statusDetail: "cc_amount_rate_limit_exceeded")
    }

    func setPaymentResultUseCase(_ useCase: PaymentResultUseCases) {
        paymentResultUseCase = useCase
    }
}
