# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'OpenWeatherMap' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'IQKeyboardManagerSwift', '5.0.0'

    # Pods for OpenWeatherMap

    target 'OpenWeatherMapTests' do
        inherit! :search_paths
        # Pods for testing
    end

    target 'OpenWeatherMapUITests' do
        inherit! :search_paths
        # Pods for testing
    end

end

target 'Service' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    pod 'RxSwift', '4.0.0'
    pod 'RxCocoa', '4.0.0'
    pod 'SwiftyJSON'
    pod 'RxAlamofire', '4.0.0'
    pod 'XCGLogger', '6.0.1'
    pod 'AlamofireObjectMapper', '5.0'

    target 'ServiceTests' do
        inherit! :search_paths
        # Pods for testing
        pod 'RxBlocking', '~> 4.0'
        pod 'RxTest',     '~> 4.0'
    end
end

