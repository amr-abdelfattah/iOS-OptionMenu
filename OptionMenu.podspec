#
# Be sure to run `pod lib lint OptionMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
    
    spec.name         = 'OptionMenu'
    spec.version      = '1.1.0'
    spec.summary      = 'An option menu contains more than a style to view in iOS.'
    spec.description  = 'It integrates with material design style and other styles to be easily configured to be viewed as suites your App.'
    spec.homepage     = 'http://smartech.com'
    
    
    
    
    spec.author             = { 'Amr' => 'amrelsayed@smartech.online' }
    
    
    spec.platform     = :ios, '10.0'
    
    spec.source       = { :path => '.' }
    spec.homepage         = 'https://github.com/Amr/OptionMenu'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    spec.license          = { :type => 'MIT', :file => 'LICENSE' }
    #spec.source           = { :git => 'https://github.com/Amr/OptionMenu.git', :tag => spec.version.to_s }
    
    spec.ios.deployment_target  = '10.0'
    
    spec.source_files = 'OptionMenu/Classes/**/*'
    
    #spec.source_files = "OptionMenuFW.framework/Headers/*.h"
    #spec.public_header_files = "OptionMenuFW.framework/Headers/*.h"
    #spec.vendored_frameworks = "OptionMenuFW.framework"
    
    
    # spec.requires_arc = true
    
    # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
    spec.dependency 'MaterialComponents/BottomSheet' , '~> 85.0.0'
    spec.dependency 'Localize-Swift' , '~> 2.0.0'
    
    spec.swift_version = '5.1'
    
end
