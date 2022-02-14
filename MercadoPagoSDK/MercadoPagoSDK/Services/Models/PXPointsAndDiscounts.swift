import Foundation

public struct PXPointsAndDiscounts: Codable {
    let points: PXPoints?
    let discounts: PXDiscounts?
    let crossSelling: [PXCrossSellingItem]?
    let viewReceiptAction: PXRemoteAction?
    let topTextBox: PXText?
    let customOrder: Bool?
    let expenseSplit: PXExpenseSplit?
    let paymentMethodsImages: [String: String]?
    let primaryButton: PXButton?
    let secondaryButton: PXButton?
    let redirectUrl: String?
    let backUrl: String?
    let autoReturn: PXAutoReturn?
    let instruction: PXInstruction?
    let infoOperation: InfoOperation?
    let bannerInfo: PXBannerInfo?

    public func getBanner() -> PXBannerInfo? {
        return bannerInfo
    }

    init(
        points: PXPoints?,
        discounts: PXDiscounts?,
        crossSelling: [PXCrossSellingItem]?,
        viewReceiptAction: PXRemoteAction?,
        topTextBox: PXText?,
        customOrder: Bool?,
        expenseSplit: PXExpenseSplit?,
        paymentMethodsImages: [String: String]?,
        primaryButton: PXButton?,
        secondaryButton: PXButton?,
        redirectUrl: String?,
        backUrl: String?,
        autoReturn: PXAutoReturn?,
        instruction: PXInstruction?,
        infoOperation: InfoOperation?,
        bannerInfo: PXBannerInfo?
    ) {
        self.points = points
        self.discounts = discounts
        self.crossSelling = crossSelling
        self.viewReceiptAction = viewReceiptAction
        self.topTextBox = topTextBox
        self.customOrder = customOrder
        self.expenseSplit = expenseSplit
        self.paymentMethodsImages = paymentMethodsImages
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
        self.redirectUrl = redirectUrl
        self.backUrl = backUrl
        self.autoReturn = autoReturn
        self.instruction = instruction
        self.infoOperation = infoOperation
        self.bannerInfo = bannerInfo
    }

    enum PointsAndDiscountsCodingKeys: String, CodingKey {
        case points = "mpuntos"
        case discounts
        case crossSelling = "cross_selling"
        case viewReceiptAction = "view_receipt"
        case topTextBox = "top_text_box"
        case customOrder = "custom_order"
        case expenseSplit = "expense_split"
        case paymentMethodsImages = "payment_methods_images"
        case primaryButton = "primary_button"
        case secondaryButton = "secondary_button"
        case redirectUrl = "redirect_url"
        case backUrl = "back_url"
        case autoReturn = "auto_return"
        case instruction = "instructions"
        case infoOperation = "operation_info"
        case bannerInfo = "banner"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PointsAndDiscountsCodingKeys.self)
        let points: PXPoints? = try container.decodeIfPresent(PXPoints.self, forKey: .points)
        let discounts: PXDiscounts? = try container.decodeIfPresent(PXDiscounts.self, forKey: .discounts)
        let crossSelling: [PXCrossSellingItem]? = try container.decodeIfPresent([PXCrossSellingItem].self, forKey: .crossSelling)
        let viewReceiptAction: PXRemoteAction? = try container.decodeIfPresent(PXRemoteAction.self, forKey: .viewReceiptAction)
        let topTextBox: PXText? = try container.decodeIfPresent(PXText.self, forKey: .topTextBox)
        let customOrder: Bool? = try container.decodeIfPresent(Bool.self, forKey: .customOrder)
        let expenseSplit: PXExpenseSplit? = try container.decodeIfPresent(PXExpenseSplit.self, forKey: .expenseSplit)
        let paymentMethodsImages: [String: String]? = try container.decodeIfPresent([String: String].self, forKey: .paymentMethodsImages)
        let primaryButton: PXButton? = try container.decodeIfPresent(PXButton.self, forKey: .primaryButton)
        let secondaryButton: PXButton? = try container.decodeIfPresent(PXButton.self, forKey: .secondaryButton)
        let redirectUrl: String? = try container.decodeIfPresent(String.self, forKey: .redirectUrl)
        let backUrl: String? = try container.decodeIfPresent(String.self, forKey: .backUrl)
        let autoReturn: PXAutoReturn? = try container.decodeIfPresent(PXAutoReturn.self, forKey: .autoReturn)
        let instruction: PXInstruction? = try container.decodeIfPresent(PXInstruction.self, forKey: .instruction)
        let infoOperation: InfoOperation? = try container.decodeIfPresent(InfoOperation.self, forKey: .infoOperation)
        let bannerInfo: PXBannerInfo? = try container.decodeIfPresent(PXBannerInfo.self, forKey: .bannerInfo)
        self.init(
            points: points,
            discounts: discounts,
            crossSelling: crossSelling,
            viewReceiptAction: viewReceiptAction,
            topTextBox: topTextBox,
            customOrder: customOrder,
            expenseSplit: expenseSplit,
            paymentMethodsImages: paymentMethodsImages,
            primaryButton: primaryButton,
            secondaryButton: secondaryButton,
            redirectUrl: redirectUrl,
            backUrl: backUrl,
            autoReturn: autoReturn,
            instruction: instruction,
            infoOperation: infoOperation,
            bannerInfo: bannerInfo
        )
    }
}
