# Uncomment the next line to define a global platform for your project

require 'cocoapods-multithread-installpod'

source 'https://github.com/CocoaPods/Specs.git'
ali_source 'alibaba-specs-mirror'
platform :ios, '8.0'

target 'CaibeiMarket' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!
  
  pod 'AFNetworking', '~> 3.0'
  pod 'YYKit', '~> 1.0.9'
  pod 'MBProgressHUD', '~> 1.0.0'
  pod 'Masonry', '~> 1.0.2'
  pod 'YTKNetwork', '~> 2.0.3'
  pod 'SDWebImage', '~> 4.0.0'
  pod 'MJRefresh', '~> 3.1.12'
  pod 'MJExtension', '~> 3.0.13'

  pod 'iCarousel', '~> 1.8.3'


# 主模块(必须)
pod 'ShareSDK3'
# Mob 公共库(必须) 如果同时集成SMSSDK iOS2.0:可看此注意事项：http://bbs.mob.com/thread-20051-1-1.html
pod 'MOBFoundation'
# UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
pod 'ShareSDK3/ShareSDKUI'

# 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
pod 'ShareSDK3/ShareSDKPlatforms/QQ'
pod 'ShareSDK3/ShareSDKPlatforms/SinaWeibo'
pod 'ShareSDK3/ShareSDKPlatforms/WeChat'

# ShareSDKPlatforms模块其他平台，按需添加
## 如果需要的平台没有对应的平台语句，有2种情况——1、不需要添加这个平台的语句，如Twitter就是这个情况。2、ShareSDK暂时不支持此平台。
#pod 'ShareSDK3/ShareSDKPlatforms/AliPaySocial'
#pod 'ShareSDK3/ShareSDKPlatforms/DingTalk'

# 使用配置文件分享模块（非必需）
pod 'ShareSDK3/ShareSDKConfigurationFile'
# 扩展模块（在调用可以弹出我们UI分享方法的时候是必需的）
pod 'ShareSDK3/ShareSDKExtension'
  # Pods for CaibeiMarket

  target 'CaibeiMarketTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CaibeiMarketUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
