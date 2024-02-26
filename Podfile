# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!
workspace 'submissionProject'
def shared_pods
  # Pods for dicoding-expert
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire'
  pod 'SDWebImage', '~> 5.0'
  pod 'SwiftLint'
  pod 'Swinject', '2.6.0'
  pod 'SwinjectStoryboard'

end

target 'submissionProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  # Pods for submissionProject
	shared_pods

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.6'
    end
  end
end
