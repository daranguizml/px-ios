import Foundation
/// :nodoc:
@objcMembers
open class PXPaymentMethod: NSObject, Codable {
    open var additionalInfoNeeded: [String]?
    open var id: String!
    open var name: String?
    open var paymentTypeId: String = ""
    open var status: String?
    open var secureThumbnail: String?
    open var thumbnail: String?
    open var deferredCapture: String?
    open var settings: [PXSetting] = []
    open var minAllowedAmount: Double?
    open var maxAllowedAmount: Double?
    open var accreditationTime: Int?
    open var merchantAccountId: String?
    open var financialInstitutions: [PXFinancialInstitution]?
    open var externalPaymentPluginImageData: NSData?
    open var paymentMethodDescription: String?
    open var processingModes: [String]?
    open var creditsDisplayInfo: PXPaymentMethodDisplayInfo?

    public init(additionalInfoNeeded: [String]?, id: String, name: String?, paymentTypeId: String, status: String?, secureThumbnail: String?, thumbnail: String?, deferredCapture: String?, settings: [PXSetting], minAllowedAmount: Double?, maxAllowedAmount: Double?, accreditationTime: Int?, merchantAccountId: String?, financialInstitutions: [PXFinancialInstitution]?, description: String?, processingModes: [String]?, creditsDisplayInfo: PXPaymentMethodDisplayInfo? = nil) {
        self.additionalInfoNeeded = additionalInfoNeeded
        self.id = id
        self.name = name
        self.paymentTypeId = paymentTypeId
        self.status = status
        self.secureThumbnail = secureThumbnail
        self.thumbnail = thumbnail
        self.deferredCapture = deferredCapture
        self.settings = settings
        self.minAllowedAmount = minAllowedAmount
        self.maxAllowedAmount = maxAllowedAmount
        self.accreditationTime = accreditationTime
        self.merchantAccountId = merchantAccountId
        self.financialInstitutions = financialInstitutions
        self.paymentMethodDescription = description
        self.processingModes = processingModes
        self.creditsDisplayInfo = creditsDisplayInfo
    }

    public enum CodingKeys: String, CodingKey {
        case additionalInfoNeeded = "additional_info_needed"
        case id
        case name
        case paymentTypeId = "payment_type_id"
        case status
        case secureThumbnail = "secure_thumbnail"
        case thumbnail
        case deferredCapture = "deferred_capture"
        case settings
        case minAllowedAmount = "min_allowed_amount"
        case maxAllowedAmount = "max_allowed_amount"
        case accreditationTime = "accreditation_time"
        case merchantAccountId = "merchant_account_id"
        case financialInstitutions = "financial_institutions"
        case paymentMethodDescription = "description"
        case processingModes = "processing_modes"
        case creditsDisplayInfo = "display_info"
    }

    public required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let additionalInfoNeeded: [String]? = try container.decodeIfPresent([String].self, forKey: .additionalInfoNeeded)
        let id: String = try container.decode(String.self, forKey: .id)
        let name: String? = try container.decodeIfPresent(String.self, forKey: .name)
        let paymentTypeId: String = try container.decodeIfPresent(String.self, forKey: .paymentTypeId) ?? ""
        let status: String? = try container.decodeIfPresent(String.self, forKey: .status)
        let secureThumbnail: String? = try container.decodeIfPresent(String.self, forKey: .secureThumbnail)
        let thumbnail: String? = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        let deferredCapture: String? = try container.decodeIfPresent(String.self, forKey: .deferredCapture)
        let settings: [PXSetting] = try container.decodeIfPresent([PXSetting].self, forKey: .settings) ?? []
        let minAllowedAmount: Double? = try container.decodeIfPresent(Double.self, forKey: .minAllowedAmount)
        let maxAllowedAmount: Double? = try container.decodeIfPresent(Double.self, forKey: .maxAllowedAmount)
        let accreditationTime: Int? = try container.decodeIfPresent(Int.self, forKey: .accreditationTime)
        let merchantAccountId: String? = try container.decodeIfPresent(String.self, forKey: .merchantAccountId)
        let financialInstitutions: [PXFinancialInstitution]? = try container.decodeIfPresent([PXFinancialInstitution].self, forKey: .financialInstitutions)
        let description: String? = try container.decodeIfPresent(String.self, forKey: .paymentMethodDescription)
        let processingModes: [String]? = try container.decodeIfPresent([String].self, forKey: .processingModes)
        let creditsDisplayInfo: PXPaymentMethodDisplayInfo? = try container.decodeIfPresent(PXPaymentMethodDisplayInfo.self, forKey: .creditsDisplayInfo)

        self.init(additionalInfoNeeded: additionalInfoNeeded, id: id, name: name, paymentTypeId: paymentTypeId, status: status, secureThumbnail: secureThumbnail, thumbnail: thumbnail, deferredCapture: deferredCapture, settings: settings, minAllowedAmount: minAllowedAmount, maxAllowedAmount: maxAllowedAmount, accreditationTime: accreditationTime, merchantAccountId: merchantAccountId, financialInstitutions: financialInstitutions, description: description, processingModes: processingModes, creditsDisplayInfo: creditsDisplayInfo)
    }
}

// MARK: Getters
extension PXPaymentMethod {
    /// :nodoc:
    @objc
    public func getId() -> String? {
        return id
    }
}
