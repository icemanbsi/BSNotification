#
# Be sure to run `pod lib lint BSNotification.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BSNotification"
  s.version          = "3.0.1"
  s.summary          = "Pop up notification like toast in Android"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Pop up notification like toast in Android. This notification will shown only for 5 seconds. You can show it at the bottom or top of you view controller.
                       DESC

  s.homepage         = "https://github.com/icemanbsi/BSNotification"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Bobby Stenly" => "iceman.bsi@gmail.com" }
  s.source           = { :git => "https://github.com/icemanbsi/BSNotification.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/icemanbsi

  s.ios.deployment_target = '8.0'

  s.source_files = 'BSNotification/Classes/**/*'
  s.resource_bundles = {
    # 'BSNotification' => ['BSNotification/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
