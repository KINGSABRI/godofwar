
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "godofwar/version"

Gem::Specification.new do |spec|
  spec.name          = "godofwar"
  spec.version       = GodOfWar::VERSION
  spec.authors       = ["KINGSABRI"]
  spec.email         = ["king.sabri@gmail.com"]

  spec.summary       = %q{Evil war builder for hackers with built-in war payloads.}
  spec.description   = %q{Evil war builder for hackers with built-in war payloads.}
  spec.homepage      = "https://github.com/KINGSABRI/godofwar"
  spec.license       = "MIT"

  spec.files         = Dir.glob("**/*")
  spec.bindir        = "bin"
  spec.executables   = ["godofwar"]
  spec.require_paths = ["lib"]

  spec.add_dependency 'rubyzip'

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/KINGSABRI/godofwar"
end
