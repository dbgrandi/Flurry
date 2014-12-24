license = <<EOT
Developer's use of the SDK is governed by the license in the applicable Flurry Terms of Service. Some components of the SDK are governed by open source software licenses. In the event of any conflict between the license in the applicable Flurry Terms of Service and the applicable open source license, the terms of the open source license shall prevail with respect to those components.
EOT

Pod::Spec.new do |s|
  s.name     = 'FlurrySDK'
  s.version  = '5.4.0'
  s.license  = { :type => 'Commercial', :text => license }
  s.summary  = 'FlurrySDK for analytics tracking and reporting. Also Ads included'
  s.homepage = 'http://www.flurry.com'
  s.author   = { 'Flurry' => 'http://www.flurry.com' }
  s.source   = { :git => 'https://github.com/AntonPalich/Flurry.git', :tag => "#{s.version}" }
  s.platform = :ios
  s.requires_arc = false
  s.default_subspec = 'FlurrySDK'

  s.subspec 'FlurrySDK' do |ss|
    ss.source_files = 'Flurry/*.h'
    ss.libraries = "z"
    ss.frameworks = 'CoreGraphics', 'Foundation', 'MediaPlayer', 'SystemConfiguration', 'UIKit', 'Security'
    ss.weak_frameworks = 'AdSupport', 'StoreKit'
    ss.vendored_libraries = 'Flurry/libFlurry_5.4.0.a'
  end

  s.subspec 'FlurryAds' do |ss|
    ss.source_files = 'FlurryAds/*.h'
    ss.frameworks = 'iAd'
    ss.vendored_libraries = 'FlurryAds/libFlurryAds_5.4.0.a'
    ss.dependency 'FlurrySDK/FlurrySDK'
  end

end
