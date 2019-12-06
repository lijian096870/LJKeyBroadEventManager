Pod::Spec.new do |s|
  s.name         = 'LJKeyBroadEventManager'
  s.summary      = '键盘弹出遮挡输入框解决方案'
  s.version      = '3.0.5'
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  
  
  s.author           = { 'lijian' => '1358756992@qq.com' }
  
  s.social_media_url = 'https://github.com/lijian096870'
  
  s.homepage     = 'https://github.com/lijian096870/LJKeyBroadEventManager'
  
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  
  s.source           = { :git => 'https://github.com/lijian096870/LJKeyBroadEventManager.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  
  s.source_files = 'LJKeyBroadEventManager/Classes/KeyBroad/*.{h,m}','LJKeyBroadEventManager/Classes/ViewControllerReateView/*.{h,m}','LJKeyBroadEventManager/Classes/LJKeyBroadEventManager.h'
  
  s.resource   = 'LJKeyBroadEventManager/Assets/LJkeyBroadEventManager.bundle'
  
  s.public_header_files = 'LJKeyBroadEventManager/Classes/LJKeyBroadEventManager.h'
  
  s.frameworks = 'UIKit'
  
  s.dependency 'LJViewController'
  s.dependency 'LJViewKit'
  
end
