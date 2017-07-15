platform :ios, '8.0'
use_frameworks!
target 'happiness' do
    pod 'GoogleAPIClientForREST/Sheets', '~> 1.2.1'
    pod 'Google/SignIn', '~> 3.0.3'
    pod 'RxSwift'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'RxSwift'
            target.build_configurations.each do |config|
                if config.name == 'Debug'
                    config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
                end
            end
        end
    end
end
