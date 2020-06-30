
Pod::Spec.new do |spec|
    
    spec.name         = 'OptionMenu'
    spec.version      = '2.0.7'
    spec.summary      = 'An option menu contains more than a style and theme (Material Bottom Sheet, PopOver, Horizontal) to view in iOS.'
    spec.description  = 'It integrates with material design style and other styles to be easily configured for viewing as suits your App.'
    spec.author       = { 'Amr Elsayed' => 'amrelsayed.mohamed@gmail.com' }
    
    spec.platform     = :ios, '10.0'
    spec.source       = { :path => '.' }
    spec.homepage         = 'https://github.com/amr-abdelfattah/iOS-OptionMenu'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    spec.license          = { :type => 'MIT', :file => 'LICENSE' }
    spec.source           = { :git => 'https://github.com/amr-abdelfattah/iOS-OptionMenu.git', :tag => 'v' + spec.version.to_s }
    
    spec.ios.deployment_target  = '10.0'
    spec.source_files = 'OptionMenu/Classes/**/*'

    spec.dependency 'MaterialComponents/BottomSheet'
    spec.dependency 'Localize-Swift'
    
    spec.swift_version = '5.1'
    
end
