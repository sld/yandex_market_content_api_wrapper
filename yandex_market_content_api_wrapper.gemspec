# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex_market_content_api_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "yandex_market_content_api_wrapper"
  spec.version       = YandexMarketContentApiWrapper::VERSION
  spec.authors       = ["Idris"]
  spec.email         = ["sld7700@gmail.com"]
  spec.description   = %q{Yandex.Market content API wrapper. More info about API: http://api.yandex.ru/market/content/ }
  spec.summary       = %q{Yandex.Market content API wrapper}
  spec.homepage      = "http://github.com/sld/yandex_market_content_api_wrapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "activeresource-response", "~> 0.5.3"
  spec.add_dependency "activeresource", "~> 3.2.14"
end
