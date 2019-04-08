Pod::Spec.new do |spec|
  spec.name         = "CDShareSheet"
  spec.version      = "0.0.5"
  spec.summary      = "CDShareSheet is created for swift which copies from WeChat."
  spec.description  = <<-DESC
       When I looking for a Share component like Wechat wich use swift but I cannot find, so I create this component and welcome to point out mistakes.
                   DESC
  spec.homepage     = "https://github.com/ChardXu/CDShareSheet"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "chardxu" => "xuchuandong520@gmail.com" }
  spec.platform     = :ios, "9.0" 
  spec.source       = {:git => "https://github.com/ChardXu/CDShareSheet.git", :tag => "#{spec.version}"}
  spec.source_files = "CDShareSheet/CDShareSheet/*.{swift}"
  spec.swift_version = "4.2"
end
