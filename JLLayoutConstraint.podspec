Pod::Spec.new do |s|
  s.name          = "JLLayoutConstraint"
  s.version       = "0.0.2"
  s.summary       = "A until for layout constraint"
  s.description   = <<-DESC
                  It is a until to add layout constraint.
                  DESC
  s.homepage      = "https://github.com/JimmyLTS/JLLayoutConstraint"
  # s.screenshots   = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license       = 'MIT'  
  s.author        = { "吕同生" => "lvtongsheng@126.com" }  
  s.source        = { :git => "https://github.com/JimmyLTS/JLLayoutConstraint.git", :tag => s.version.to_s }  
  
  s.platform      = :ios, '8.0'    
  s.requires_arc  = true  
  
  s.source_files  = 'JLLayoutConstraint/JLLayoutConstraint/*.{h,m}'   
end
