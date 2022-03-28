Pod::Spec.new do |s|
  s.name = 'DesignSystemUI'
  s.version = '1.0.2'
  s.authors = 'Prisma Media'
  s.summary = 'Design System base'
  s.homepage = 'https://github.com/prismamedia/ios-designSystem.git'
  s.license = "BSD 3"
  
  s.platform = :ios
  s.ios.deployment_target = '13.0'
  
  s.source = { :git => 'https://github.com/prismamedia/ios-designSystem.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  
  s.requires_arc = true
  s.frameworks = 'SwiftUI'
  
  s.source_files = 'Sources/**/*.{swift,rb}'
end