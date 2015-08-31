license = <<EOT
Developer's use of the SDK is governed by the license in the applicable Flurry Terms of Service. Some components of the SDK are governed by open source software licenses. In the event of any conflict between the license in the applicable Flurry Terms of Service and the applicable open source license, the terms of the open source license shall prevail with respect to those components.
EOT

Pod::Spec.new do |s|
  s.name     = 'FlurrySDK'
  s.version  = '6.7.1-beta1'
  s.license  = { :type => 'Commercial', :text => license }
  s.summary  = 'FlurrySDK for analytics tracking and reporting. Also Ads included'
  s.homepage = 'http://www.flurry.com'
  s.author   = { 'Flurry' => 'http://www.flurry.com' }
  s.source   = { :git => 'https://github.com/dbgrandi/Flurry.git', :tag => "#{s.version}" }
  s.platform = :ios
  s.requires_arc = false
  s.default_subspec = 'FlurrySDK'

  s.subspec 'FlurrySDK' do |ss|
    ss.source_files = [
      'Flurry/Flurry.h',
      'Flurry/Empty.m'
    ]
    # To ensure frameworks really used by lib you can use:
    # SystemConfiguration: nm -m Flurry/*.a | grep -v 'non-external' | grep _SC
    # UIKit used:          nm -m Flurry/*.a | grep -v 'non-external' | grep _UI
    # Security used:       nm -m Flurry/*.a | grep -v 'non-external' | grep _Sec
    ss.frameworks = 'Foundation', 'SystemConfiguration', 'UIKit', 'Security'
    ss.vendored_libraries = "Flurry/libFlurry_6.7.0.a"
  end

  s.subspec 'FlurryWatchSDK' do |ss|
    ss.source_files = [
      'Flurry/*.h',
      'Flurry/Empty.m'
    ]
    # To ensure frameworks really used by lib you can use:
    # SystemConfiguration: nm -m Flurry/*.a | grep -v 'non-external' | grep _SC
    # UIKit used:          nm -m Flurry/*.a | grep -v 'non-external' | grep _UI
    # Security used:       nm -m Flurry/*.a | grep -v 'non-external' | grep _Sec
    ss.frameworks = 'Foundation', 'SystemConfiguration', 'UIKit', 'Security'
    ss.vendored_libraries = "Flurry/libFlurry_6.7.0.a"
  end

  s.subspec 'FlurryAds' do |ss|
    ss.source_files = [
      'FlurryAds/**/*.h',
      'Flurry/Empty.m'
    ]
    # To ensure lib really used by lib you can use:
    # libz.dylib:  nm -m FlurryAds/*.a | grep -v 'non-external' | grep _inflate
    ss.libraries = "z"
    # To ensure frameworks really used by lib you can use:
    # iAd used:    nm -m FlurryAds/*.a | grep -v 'non-external' | grep _Ad
    # MediaPlayer: nm -m FlurryAds/*.a | grep -v 'non-external' | grep _MP
    ss.frameworks = 'iAd', 'MediaPlayer'
    # next frameworks is optional according:
    # http://support.flurry.com/index.php?title=Guides/s/Mediation/Code/Banners
    # To ensure frameworks really used by lib you can use:
    # AdSupport used:     nm -m FlurryAds/*.a | grep -v 'non-external' | grep _AS
    # StoreKit not used?: nm -m FlurryAds/*.a | grep -v 'non-external' | grep _SK
    ss.weak_frameworks = 'AdSupport', 'StoreKit'
    ss.vendored_libraries = "FlurryAds/libFlurryAds_6.7.0.a"
    ss.dependency 'FlurrySDK/FlurrySDK'
  end

end
