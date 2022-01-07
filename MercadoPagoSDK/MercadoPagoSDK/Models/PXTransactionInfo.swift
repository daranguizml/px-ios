import Foundation

final class PXTransactionInfo: Codable {
    var bankInfo: PXBankInfo?
    var financialInstitutionId: String?

    enum CodingKeys: String, CodingKey {
        case bankInfo = "bank_info"
        case financialInstitutionId = "financial_institution_id"
    }
}

final class PXBankInfo: Codable {
    var accountId: String?

    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
    }
}
