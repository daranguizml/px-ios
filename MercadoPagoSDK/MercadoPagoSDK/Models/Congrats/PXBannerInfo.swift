//
//  PXBannerInfo.swift
//  MercadoPagoSDKV4
//
//  Created by Diego Ivan Aranguiz Toledo on 08-02-22.
//

import Foundation

public class PXBannerInfo: Codable {
    public var imgUrl: String?
    public var clickUrl: String?
    public var printUrl: String?
    public var deepLink: String?
    public var label: String?

    public init(imgUrl: String, clickUrl: String, printUrl: String, deepLink: String, label: String) {
        self.imgUrl = imgUrl
        self.clickUrl = clickUrl
        self.printUrl = printUrl
        self.deepLink = deepLink
        self.label = label
    }
}
