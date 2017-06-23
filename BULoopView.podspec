#
# Be sure to run `pod lib lint BULoopView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BULoopView'
  s.version          = '0.1.1'
  s.summary          = 'Loopable UIScroolView for Swift 3.1'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/burakustn/BULoopView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'burakustn@gmail.com' => 'burakustn@gmail.com' }
  s.source           = { :git => 'https://github.com/burakustn/BULoopView.git', :tag => '0.1.1' }
  s.social_media_url = 'https://twitter.com/burakustn'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BULoopView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BULoopView' => ['BULoopView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Kingfisher'
end