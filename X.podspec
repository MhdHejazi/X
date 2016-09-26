Pod::Spec.new do |spec|
  spec.name        = 'X'
  spec.version     = '0.3.1'
  spec.summary     = 'Easier cross platform Mac & iOS development with Swift.'
  spec.author      = { 'Sam Soffes' => 'sam@soff.es' }
  spec.homepage    = 'https://github.com/soffes/X'
  spec.license     = { :type => 'MIT' }

  spec.source              = { :git => 'https://github.com/MhdHejazi/X.git' }
  spec.source_files        = 'Sources/*.swift'
  spec.osx.source_files    = 'Sources/*.{h,m}'
  
  spec.osx.deployment_target       = "10.10"
  spec.ios.deployment_target       = "9.0"
  spec.tvos.deployment_target      = "9.0"
  spec.watchos.deployment_target   = "3.0"
end
