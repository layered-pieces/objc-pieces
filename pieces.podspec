#
#  Be sure to run `pod spec lint pieces.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name               = "pieces"
  s.version            = "0.2.0"
  s.summary            = "Objective-C pieces, heavily inspired by uber RIBs"
  s.homepage           = "https://github.com/objc-pieces/pieces"
  s.license            = "MIT"
  s.author             = { "Oliver Letterer" => "oliver.letterer@gmail.com" }
  s.social_media_url   = "https://twitter.com/OliverLetterer"
  s.platform           = :ios, "9.0"
  s.source             = { :git => "https://github.com/objc-pieces/pieces.git", :tag => "#{s.version}" }
  s.requires_arc       = true

  s.description  = <<-DESC
  Objective-C pieces, heavily inspired by uber RIBs

  https://github.com/uber/RIBs
                   DESC

  s.default_subspec = 'core'

  s.subspec 'core' do |ss|
    ss.source_files = 'pieces'
    
    ss.dependency 'pieces/di'
    ss.dependency 'pieces/reactive'
  end

  s.subspec 'di' do |ss|
    ss.source_files = 'pieces/di'
  end
  
  s.subspec 'reactive' do |ss|
    ss.source_files = 'pieces/reactive'
  end
end
