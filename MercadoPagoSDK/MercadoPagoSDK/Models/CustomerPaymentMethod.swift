import UIKit

@objcMembers class CustomerPaymentMethod: NSObject, PXCardInformation, PaymentMethodOption {
    var id: String
    var customerPaymentMethodDescription: String
    var paymentMethodId: String
    var paymentMethodTypeId: String
    var firstSixDigits: String!
    var lastFourDigits: String
    var disabledOption: Bool = false

    var securityCode: PXSecurityCode?
    var paymentMethod: PXPaymentMethod?

    var issuer: PXIssuer?

    init(id: String, paymentMethodId: String, paymentMethodTypeId: String, description: String, issuer: PXIssuer?, firstSixDigits: String, lastFourDigits: String) {
        self.paymentMethodId = paymentMethodId
        self.paymentMethodTypeId = paymentMethodTypeId
        self.customerPaymentMethodDescription = description
        self.issuer = issuer
        self.firstSixDigits = firstSixDigits
        self.lastFourDigits = lastFourDigits
        self.id = id
    }

    func getIssuer() -> PXIssuer? {
        return issuer
    }

    func getFirstSixDigits() -> String {
        return firstSixDigits
    }

    func isSecurityCodeRequired() -> Bool {
        return true
    }

    func getCardId() -> String {
        return self.id
    }

    func getCardSecurityCode() -> PXSecurityCode? {
        return securityCode
    }

    func getCardDescription() -> String {
        return self.customerPaymentMethodDescription
    }

    func getPaymentMethod() -> PXPaymentMethod? {
        return paymentMethod
    }

    func getPaymentMethodId() -> String {
        return self.paymentMethodId
    }

    func getPaymentTypeId() -> String {
        return self.paymentMethodTypeId
    }

    func getCardBin() -> String? {
        return firstSixDigits
    }

    func getCardLastForDigits() -> String {
        return lastFourDigits
    }

    func setupPaymentMethod(_ paymentMethod: PXPaymentMethod) {
        self.paymentMethod = paymentMethod
    }

    func setupPaymentMethodSettings(_ settings: [PXSetting]) {
        self.securityCode = settings.first?.securityCode
    }

    func isIssuerRequired() -> Bool {
        return false
    }

    func setDisabled(_ disabled: Bool) {
        disabledOption = disabled
    }

    func isDisabled() -> Bool {
        return disabledOption
    }

    /** PaymentOptionDrawable implementation */

    func getTitle() -> String {
        return getCardDescription()
    }

    /** PaymentMethodOption  implementation */

    func hasChildren() -> Bool {
        return false
    }

    func getChildren() -> [PaymentMethodOption]? {
        return nil
    }

    func getId() -> String {
        return self.id
    }

    func isCustomerPaymentMethod() -> Bool {
        return true
    }

    func isCard() -> Bool {
        return PXPaymentTypes.isCard(paymentTypeId: self.paymentMethodTypeId)
    }

    func canBeClone() -> Bool {
        return false
    }

    func getPaymentType() -> String {
        return paymentMethodTypeId
    }

    func containsSavedId(_ savedCardIds: [String]) -> Bool {
        return savedCardIds.contains(getCardId()) || savedCardIds.contains("esc_card" + "_" + getFirstSixDigits() + "_" + getCardLastForDigits())
    }
}
