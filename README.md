Tax Easy
=====

[![Code Climate](https://codeclimate.com/github/valencar/tax_easy/badges/gpa.svg)](https://codeclimate.com/github/valencar/tax_easy)  [![Travis](https://travis-ci.org/valencar/tax_easy.svg?branch=master)](https://travis-ci.org/valencar/tax_easy)

[![Gem Version](https://badge.fury.io/rb/tax_easy.svg)](https://badge.fury.io/rb/tax_easy)

Ruby Gem to calculate Taxes.

### Installation

```ruby
gem 'tax_easy'
```

Run the bundle command to install it.

### Calculators - Brazil


#### IOF

```ruby
TaxEasy::Financial::Brazil::IOF.new.calculate(20_000, 48, 1.5) # ==> 356.70671942746617
```

IOF varies according to type of loan. We need to implement them.

You can override the default base IOF value. Example:

```ruby
TaxEasy::Financial::Brazil::IOF.new(iof_day: 0.0038, iof_additional: 0.000050)
```

### TODO

There's a lot of taxes to be implemented.

So feel free to contribute! \o/.


## Contributing
 1. Fork the repository
 2. Create a branch
 4. Create a spec + code
 5. Open a Pull Request ;)
