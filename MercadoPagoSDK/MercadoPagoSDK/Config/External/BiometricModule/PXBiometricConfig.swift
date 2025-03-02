import Foundation

/**
 Whe use this object to store properties related to Biometric module.
Check PXBiometricProtocol methods.
 */
@objcMembers
open class PXBiometricConfig: NSObject {
    public let flowIdentifier: String
    public var params: [String: Any] = [:]

    enum ParamKey: String {
        case amount
    }

    init(_ flowIdentifier: String) {
        self.flowIdentifier = flowIdentifier
    }
}

// MARK: Internals (Only PX)
extension PXBiometricConfig {
    func setAmount(_ amount: NSDecimalNumber) {
        self.params[ParamKey.amount.rawValue] = amount
    }

    func setParam(key: String, value: Any) {
        self.params[key] = value
    }

    static func createConfig(withFlowIdentifier: String? = nil, andAmount: NSDecimalNumber? = nil) -> PXBiometricConfig {
        let pxProductId: String = "BJEO9NVBF6RG01IIIOTG"
        var defaultConfig = PXBiometricConfig(pxProductId)

        if let flowIdentifier = withFlowIdentifier {
            defaultConfig = PXBiometricConfig(flowIdentifier)
        }

        guard let amount = andAmount else { return defaultConfig }
        defaultConfig.setAmount(amount)
        return defaultConfig
    }
}
