Pod::Spec.new do |s|
  
  s.name         = "CDKOraccInterface"
  s.version      = "0.0.1"
  s.summary      = "A simple interface to Oracc open data on the internet"
  
  
  s.description  = <<-DESC
  This package provides a thin layer over the Oracc JSON API and Oracc JSON Github repo, converting the cuneiform data into [CDKSwiftOracc](https://github.com/ckanchan/CDKSwiftOracc).
  DESC
  
  s.homepage     = "https://github.com/ckanchan/CDKOraccInterface"
  
  
  s.license      = "GPL3"
  
  
  s.author    = "Chaitanya Kanchan"
  
  
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.12"
  
  
  s.source       = { :git => "https://github.com/ckanchan/CDKOraccInterface.git", :tag => "#{s.version}" }
  
  
  
  
  s.source_files  = "Sources/CDKOraccInterface"
  
  
  
  s.frameworks = "CDKSwiftOracc", "ZIPFoundation"
  
  s.dependency "CDKSwiftOracc"
  s.dependency "ZIPFoundation"
  s.swift_version = "4.1"
  
end
