
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "xi/superdirt/version"

Gem::Specification.new do |spec|
  spec.name          = "xi-superdirt"
  spec.version       = Xi::Superdirt::VERSION
  spec.authors       = ["rapofran"]
  spec.email         = ["rapofran@riseup.net"]

  spec.summary       = %q{SuperDirt support for Xi}
  spec.homepage      = %q{https://github.com/xi-livecode/xi-superdirt}
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "xi-lang", "~> 0.2.0"
end
