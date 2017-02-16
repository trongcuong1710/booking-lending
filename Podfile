# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'booklending' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'Google/SignIn'
  pod 'Swinject', '2.0.0'
  pod 'PromiseKit', '~> 4.0'
  pod 'UIAlertController+Blocks'

  target 'booklendingTests' do
    inherit! :search_paths
    
    pod 'Quick'
    pod 'Nimble'
  end

  target 'booklendingUITests' do
    inherit! :search_paths
    
    pod 'KIF'
  end

end
