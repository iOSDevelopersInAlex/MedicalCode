# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MedicalCode' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MedicalCode
  pod 'Cosmos'
  pod 'MarqueeLabel/Swift'
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'AlamofireObjectMapper', '~> 5.0'

end
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end

end
