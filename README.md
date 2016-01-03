[![Build Status](https://img.shields.io/shippable/568908111895ca4474673ec5.svg)](https://app.shippable.com/projects/568908111895ca4474673ec5/builds/latest)

# auto_autoloader

## Install

```ruby
gem "auto_autoloader"
```

## Usage

File: "lib/my_class.rb"
```ruby
class MyClass
  AutoAutoloader.autoload_sub_classes(self, __FILE__)
end
```

It will now try to autoload "MyClass:SubClass" in the following path: "lib/my_class/sub_class.rb".

## Contributing to auto_autoloader

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2016 kaspernj. See LICENSE.txt for
further details.

