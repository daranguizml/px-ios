import Foundation

/**
Default PX implementation of Biometric for public distribution. (No-validation)
 */
final class PXBiometricDefault: NSObject, PXBiometricProtocol {
    func validate(config: PXBiometricConfig, onSuccess: @escaping () -> Void, onError: (Error) -> Void) {
        onSuccess()
    }

    func isValidationRequired(config: PXBiometricConfig) -> Bool {
        return false
    }
}
