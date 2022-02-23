//
//  PXBannerData.swift
//  MercadoPagoSDKV4
//
//  Created by Diego Ivan Aranguiz Toledo on 08-02-22.
//

import UIKit
import MLBusinessComponents

class PXBannerData: NSObject, MLBusinessAdsBannerData {
    let bannerInfo: PXBannerInfo

    init(bannerInfo: PXBannerInfo) {
        self.bannerInfo = bannerInfo
    }

    func getImageUrl() -> String {
        return self.bannerInfo.imgUrl ?? ""
    }

    func getClickUrl() -> String {
        return self.bannerInfo.clickUrl ?? ""
    }

    func getPrintUrl() -> String {
        return self.bannerInfo.printUrl ?? ""
    }

    func getDeepLink() -> String {
        return self.bannerInfo.deepLink ?? ""
    }
}
