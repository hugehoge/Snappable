Pod::Spec.new do |s|
  s.name             = 'Snappable'
  s.version          = '0.3.0'
  s.summary          = 'A set of SwiftUI custom modifiers to make the ScrollView snappable.'
  s.description      = 'A set of SwiftUI custom modifiers to make the ScrollView snappable. The goal of this library is to provide an easy way to implement Views such as carousels and slideshows.'
  s.homepage         = 'https://github.com/hugehoge/Snappable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hugehoge' => 'hugehoge42@gmail.com' }
  s.source           = { :git => 'https://github.com/hugehoge/Snappable.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.swift_versions   = ['5.3', '5.4', '5.5']
  s.source_files     = 'Sources/**/*.swift'
end
