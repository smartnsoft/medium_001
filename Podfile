source 'https://github.com/CocoaPods/Specs.git'

project './Session/Session.xcodeproj'
inhibit_all_warnings!

abstract_target 'AppCommon' do

  platform :ios, '10.0'
  use_frameworks!

  # UI
  pod 'Reusable',                      '~> 4.0.0'

  # Utilities
  pod 'SwiftGen',                      '~> 5.2.1'
  pod 'SwiftLint',                     '~> 0.23.1'
  pod 'SwiftyBeaver',                  '~> 1.4.2'

  target 'Session' do
    
  end

end

post_install do |installer|

  swift3_pods = %w()

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|

      version = swift3_pods.include?(target.name) ? '3.2' : '4.0'
      config.build_settings['SWIFT_VERSION'] = version

      # puts "Disabling code signing for #{target.name} for configuration #{config.name}"
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ''
      config.build_settings['CODE_SIGNING_REQUIRED'] = 'NO'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'

      if config.name == 'Release'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      else
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      end

    end
  end

end
