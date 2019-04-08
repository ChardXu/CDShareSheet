Pod::Spec.new do |s|
  s.name         = "CDShareSheet"
  s.version      = "0.0.1"
  s.summary      = "CDShareSheet is created for swift which copies from WeChat."
  s.description  = <<-DESC
                       When I looking for a Share component like Wechat wich use swift but I cannot find, so I create this component and welcome to point out mistakes.
                   DESC
  s.homepage     = "https://github.com/ChardXu/CDShareSheet"
  s.license      = {:type => "MIT", :file => "LICENSE"}
  s.author       = {"chardxu" => "xuchuandong520@gmail.com"}
  s.platform     = :ios, "9.0"
  s.source       = {:git => "https://github.com/ChardXu/CDShareSheet.git", :tag => "#{s.version}"}
  s.source_files  = "CDShareSheet/*.swift"
  s.swift_version = "4.2"
end

