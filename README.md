# PrimeMultiplicationTable

## Coding Challenge

Objective

Write a program that prints out a multiplication table of the first 10 prime number.

  * The program must run from the command line and print one table to STDOUT.
  * The first row and column of the table should have the 10 primes, with each cell containing the product of the primes for the corresponding row and column.

Notes

* Consider complexity. How fast does your code run? How does it scale?
* Consider cases where we want N primes.
* Do not use the Prime class from stdlib (write your own code).
* Write tests. Try to demonstrate TDD/BDD.
* If you're using external dependencies please specify those dependencies and how to install them.
* Please package your code. OR include running instructions.

This gem uses three algorithms to generate prime numbers:

* Primality test by trial division
* Sieve of Eratosthenes
* Sieve of Atkins (initial version, needs optimization)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prime_multiplication_table'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prime_multiplication_table

## Configuration

Table header and prime generator are configurable. To do that just add the following block in your code and modify its values:

```
PrimeMultiplicationTable.configure do |config|
  config.prime_generator = :atkins
  config.table_header = "Multiplication table for the first 10 prime numbers"
end
```

## Usage

Execute:  

    $ pmt <number> [ATKINS | ERASTOTHENES | TRIAL]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/refactor8/prime_multiplication_table. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PrimeMultiplicationTable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/refactor8/prime_multiplication_table/blob/master/CODE_OF_CONDUCT.md).
