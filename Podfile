# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'UMLMaker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'

  pod 'SnapKit', '~> 5.0.0'

  pod 'LookinServer', :configurations => ['Debug']

end

deployment_target = '11.0'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
            end
        end
        project.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
    end
end