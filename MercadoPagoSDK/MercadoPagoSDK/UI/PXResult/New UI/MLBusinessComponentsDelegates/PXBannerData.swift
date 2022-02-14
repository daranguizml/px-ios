//
//  PXBannerData.swift
//  MercadoPagoSDKV4
//
//  Created by Diego Ivan Aranguiz Toledo on 08-02-22.
//

import UIKit
import MLBusinessComponents

class PXBannerData: NSObject, MLBusinessBannerData {
    let bannerInfo: PXBannerInfo

    init(bannerInfo: PXBannerInfo) {
        self.bannerInfo = bannerInfo
    }

    func getTitle() -> String {
        return self.bannerInfo.label!
    }

    func getImageURL() -> String {
        return self.bannerInfo.imgUrl!
    }

    func getDeepLink() -> String {
         return self.bannerInfo.imgUrl!
    }

    func getPrint() -> String {
         return self.bannerInfo.printUrl!
    }

    func getClick() -> String {
         return self.bannerInfo.clickUrl!
    }
}
