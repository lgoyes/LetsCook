# Uncomment the next line to define a global platform for your project
platform :ios, '13.2'

def rxPods
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'
end

def imageDownloadManager
  pod 'Kingfisher'
end

target 'LetsCook' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LetsCook
  rxPods
  imageDownloadManager
  
  target 'LetsCookTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'LetsCookUITests' do
    # Pods for testing
    inherit! :search_paths
  end

end
