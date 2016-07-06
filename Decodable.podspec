Pod::Spec.new do |s|
  s.name             = "Decodable"
  s.version          = "0.4.3"
  s.summary          = "Swift 2 JSON parsing done (more) right"
  s.description      = "Simple yet powerful object mapping made possible by Swift 2's new error handling. Greatly inspired by Argo, but without any functional programming and bizillion operators."
  s.homepage         = "https://github.com/Anviking/Decodable"
  s.license          = 'MIT'
  s.author           = { "Anviking" => "anviking@me.com" }
  s.source           = { :git => "https://github.com/Anviking/Decodable.git", :tag => "v#{s.version}" }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.requires_arc = true
  s.source_files = 'Sources/*.{swift,h}'
end
