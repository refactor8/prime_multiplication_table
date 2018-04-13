
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prime_multiplication_table/version"

Gem::Specification.new do |spec|
  spec.name          = "prime_multiplication_table"
  spec.version       = PrimeMultiplicationTable::VERSION
  spec.authors       = ["Ryan Flores"]
  spec.email         = ["refactor8@gmail.com"]

  spec.summary       = "Coding Challenge: Prints out a multiplication table of the first 10 prime number."
  spec.description   = "The program must run from the command line and print one table to STDOUT.
                        The first row and column of the table should have the 10 primes, with each cell
                        containing the product of the primes for the corresponding row and column."
  spec.homepage      = "https://github.com/refactor8/prime_multiplication_table"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'pmt'

  spec.require_paths = ["lib"]

  spec.add_dependency "terminal-table", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_development_dependency "simplecov", "~> 0.16.1"
end
