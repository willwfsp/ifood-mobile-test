# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
    pod 'Swinject', '2.3.0'
    pod 'SwinjectAutoregistration'
end

target 'Domain' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Domain
  
  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Humour' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Humour
  pod 'TwitterKit', '~> 3.1'
  common_pods
  
  target 'HumourTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Presentation' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  

  # Pods for Presentation
  common_pods
  pod 'TwitterKit', '~> 3.1'
  pod 'Kingfisher', '~> 4.0'
  pod 'Reusable', '~> 4.0'
  pod 'SwinjectStoryboard'
  
  target 'PresentationTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Store' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Store
  pod 'TwitterKit', '~> 3.1'
  pod 'Moya', '~> 11.0'
  pod 'GTMAppAuth'
  
  target 'StoreTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Utils' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Utils

  target 'UtilsTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
