Pod::Spec.new do |s|
  s.name             = "MercadoPagoSDKV4"
  s.version          = "4.0.0.beta.36"
  s.summary          = "MercadoPagoSDK"
  s.homepage         = "https://www.mercadopago.com"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = "Mercado Pago"
  s.source           = { :git => "https://github.com/mercadopago/px-ios.git", :tag => s.version.to_s }
  s.swift_version = '4.0'
  s.platform     = :ios, '9.0'
  s.requires_arc = true
  s.default_subspec = 'Default'

  s.subspec 'Default' do |default|
    default.resources = ['MercadoPagoSDK/MercadoPagoSDK/*.xcassets','MercadoPagoSDK/MercadoPagoSDK/*/*.xcassets', 'MercadoPagoSDK/MercadoPagoSDK/*.ttf', 'MercadoPagoSDK/MercadoPagoSDK/**/**.{plist,xib,strings}', 'MercadoPagoSDK/MercadoPagoSDK/*.lproj']
    default.source_files = ['MercadoPagoSDK/MercadoPagoSDK/**/**/**.{h,m,swift}']
    s.dependency 'MercadoPagoPXTrackingV4', '2.1.3'
    s.dependency 'MercadoPagoServicesV4', '1.0.17'
    s.dependency 'MLUI', '~> 5.0'
  end

end
