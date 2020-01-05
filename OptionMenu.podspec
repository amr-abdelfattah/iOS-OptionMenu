#
# Be sure to run `pod lib lint OptionMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
    
    spec.name         = 'OptionMenu'
    spec.version      = '2.0.0'
    spec.summary      = 'An option menu contains more than a style and theme to view in iOS.'
    spec.description  = 'It integrates with material design style and other styles to be easily configured for viewing as suits your App.'
    spec.author       = { 'Amr Elsayed' => 'amrelsayed.mohamed@gmail.com' }
    
    spec.platform     = :ios, '10.0'
    spec.source       = { :path => '.' }
    spec.homepage         = 'https://github.com/amr-abdelfattah/iOS-Material-Bottom-Sheet'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    spec.license          = { :type => 'MIT', :file => 'LICENSE' }
    spec.source           = { :git => 'https://github.com/amr-abdelfattah/iOS-Material-Bottom-Sheet.git', :tag => spec.version.to_s }
    
    spec.ios.deployment_target  = '10.0'
    spec.source_files = 'OptionMenu/Classes/**/*'

    spec.dependency 'MaterialComponents/BottomSheet' , '~> 85.0.0'
    spec.dependency 'Localize-Swift' , '~> 2.0.0'
    
    spec.swift_version = '5.1'
    
end
