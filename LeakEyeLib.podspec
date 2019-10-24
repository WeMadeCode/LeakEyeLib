#
# Be sure to run `pod lib lint LeakEyeLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LeakEyeLib'
  s.version          = '0.1.2'
  s.summary          = '内存泄漏检测工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Swift版本的内存泄漏检测工具，在LeakEye的基础上继续维护。
                       DESC

  s.homepage         = 'https://github.com/WeMadeCode/LeakEyeLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhouxiang' => 'zhouxiang@huami.com' }
  s.source           = { :git => 'https://github.com/WeMadeCode/LeakEyeLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'LeakEyeLib/Classes/**/*.swift'
  
  # s.resource_bundles = {
  #   'LeakEyeLib' => ['LeakEyeLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
