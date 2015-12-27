Pod::Spec.new do |s|
  s.name         = "AXStylishNavigationBar"
  s.version      = "1.0.0-alpha.0"
  s.summary      = "AXStylishNavigationBar is a category can let you dynamically change the default style of UINavigationBar."
  s.homepage     = "https://github.com/Alchemistxxd/AXStylishNavigationBar"
  s.license      = "MIT"
  s.author       = { "Alchemistxxd" => "the_shadow_xxd@hotmail.com" }
  s.source       = { :git => "https://github.com/Alchemistxxd/AXStylishNavigationBar.git", :tag => 'v1.0.0-alpha.0'}
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = "AXStylishNavigationBar/*"
  s.frameworks   = 'Foundation', 'UIKit'

end