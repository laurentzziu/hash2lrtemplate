[![Build Status](https://travis-ci.org/laurentzziu/hash2lrtemplate.svg?branch=master)](https://travis-ci.org/laurentzziu/hash2lrtemplate)
[![Gem Version](https://badge.fury.io/rb/hash2lrtemplate.svg)](https://rubygems.org/gems/hash2lrtemplate)
[![Maintainability](https://api.codeclimate.com/v1/badges/2b822e7586dae7602550/maintainability)](https://codeclimate.com/github/laurentzziu/hash2lrtemplate/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2b822e7586dae7602550/test_coverage)](https://codeclimate.com/github/laurentzziu/hash2lrtemplate/test_coverage)


# Hash2lrtemplate

Convert `Hash` objects to strings formatted as `.lrtemplate` (Adobe Lightroom) files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash2lrtemplate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash2lrtemplate

## Usage

### Call the convertor

```ruby
hash = {
  s: {
    id: "635D4B13-0693-458A-9EA3-9B0FE599A2E3",
    internal_name: "Hash2lrtemplate test demo",
    title: "Hash2lrtemplate test demo",
    type: "Develop",
    value: {
      uuid: "DA481B09-FABA-4551-A981-08C13F519C07",
      settings: {
        Blacks2012: -20,
        Tint: 10,
        ConvertToGrayscale: false,
        CameraProfile: "Adobe Standard",
        ToneCurvePV2012Red: [0, 0, 57, 40, 144, 147, 196, 206, 255, 255]
      }
    },
    version: 0
  }
}

Hash2lrtemplate::Convertor.new(hash).call
# or call the .call method directly on the class
Hash2lrtemplate::Convertor.call(hash)
#  => "s = {id = \"635D4B13-0693-458A-9EA3-9B0FE599A2E3\",internalName = \"Hash2lrtemplate test demo\",title = \"Hash2lrtemplate test demo\",type = \"Develop\",value = {uuid = \"DA481B09-FABA-4551-A981-08C13F519C07\",settings = {Blacks2012 = -20,Tint = 10,ConvertToGrayscale = false,CameraProfile = \"Adobe Standard\",ToneCurvePV2012Red = {0,0,57,40,144,147,196,206,255,255,},},},version = 0,}"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/laurentzziu/hash2lrtemplate>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hash2lrtemplate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/laurentzziu/hash2lrtemplate/blob/master/CODE_OF_CONDUCT.md).
