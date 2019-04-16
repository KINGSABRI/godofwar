
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "godofwar/version"

Gem::Specification.new do |spec|
  spec.name          = "godofwar"
  spec.version       = GodOfWar::VERSION
  spec.authors       = ["KINGSABRI"]
  spec.email         = ["king.sabri@gmail.com"]

  spec.summary       = %q{GodOfWar - Malicious Java WAR builder}
  spec.description   = %q{Evil war builder for hackers with built-in war payloads.}
  spec.homepage      = "https://github.com/KINGSABRI/godofwar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/})}
  spec.bindir        = 'bin'
  spec.executables   = ['godofwar']
  spec.require_paths = ['lib']

  spec.add_dependency 'rubyzip', '~> 1.2'

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/KINGSABRI/godofwar"
end
