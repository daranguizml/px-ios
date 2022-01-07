import Foundation

public struct BankTransferDto: Codable {
    let displayInfo: BankTransferDisplayInfo?
    
    enum CodingKeys: String, CodingKey {
        case displayInfo = "display_info"
    }
}
