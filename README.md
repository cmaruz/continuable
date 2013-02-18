# continuable

Continuable is a gem that helps you resuming execution flow after rescuing exceptions.

# Usage

## Installation
add to your Gemfile :

    gem 'continuable'

## Defining a continuable exception

```ruby
class ContinuableException < Exception
  ...
  include Continuable
  ...
end
```

## Throwing a continuable exception on the fly

```ruby
...
raise_continuable Exception.new
...
```

## Resuming an exception
```ruby
rescue Exception => ex
  ex.continue
 end
```

# Credits
This gem was inspired by:

- This talk about exceptions by Avdi Grimm: http://avdi.org/talks/rockymtnruby-2011/things-you-didnt-know-about-exceptions.html
- The acread gem (https://github.com/yarmand/acread)

# Copyright

Copyright (c) 2013 Mario Caropreso and Yann Armand. See LICENSE.txt for
further details.