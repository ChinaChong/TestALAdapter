Pod::Spec.new do |spec|

  spec.name         = "SinoTestShell"
  spec.version      = "1.0.0"
  spec.summary      = "Test Shell Script"
  spec.homepage     = "https://github.com/ChinaChong/TestPodRepo"
  spec.license      = "MIT"
  spec.author       = { "nox_chong" => "chinachong1943@163.com" }

  spec.platform     = :ios
  spec.ios.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/ChinaChong/TestALAdapter.git", :tag => "#{spec.version}" }
  spec.source_files = "Noxmobi.framework/Headers/*.{h}"
  # spec.source_files = "AppLovinMediationGoogleAdapter.framework/Headers/*.{h}", "AppLovinMediationFacebookAdapter.framework/Headers/*.{h}"

  spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  spec.ios.vendored_frameworks = 'Noxmobi.framework'
  spec.requires_arc = true
  # spec.frameworks = "Foundation", "UIKit", "VideoToolbox", "StoreKit", "CoreMedia", "AVFoundation", "WebKit", "CoreMotion", "SystemConfiguration", "AudioToolBox" #依赖多个系统framework
  # vspec.libraries = "xml2", "c++" # 设置依赖多个系统的library
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  #spec.dependency "Google-Mobile-Ads-SDK", "7.48.0"

end