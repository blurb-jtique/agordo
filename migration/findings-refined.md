This document describes some notes about issues and workarounds I encountered when moving from Ruby 1.9 Rails 2 to Ruby 2.7 Rails 3
# Migrating Ruby from 1.9.3 to 2.7.8

## Dependencies - gems affected

### aws-sdk
nokogiri
json

### bbf
nokogiri

### sanitize
nokogiri

### webrat
nokogiri

### esa_tasks **
fix nokogiri

### yard pygments **
fix pygments - using yajl-ruby
.yardopts file
--plugin yard-pygmentsrb
--plugin yard-restful

### esa tasks
fix esa tasks

### guard and listen
ffi

### pry-debugger ** switch to byebug
fix debugger

### upgrades - new gems updated
gem 'nokogiri', '1.14.5'
gem 'json', '1.8.5'
the require changed
gem 'yajl-ruby', '~> 1.4.1', :require => 'yajl'
gem 'ffi', '1.13.1', :git => 'https://github.com/ffi/ffi', submodules: true
gem 'pg', '1.3.5'
gem 'rmagick', '4.3.0'
gem 'ruby-prof', '~> 1.6.3'
gem 'thin', '1.8.2'

### not explicit but required in money gem
lib/money/lib/money.rb:4
gem 'rexml', '~> 3.1.9.1'

bundler to 2.3

### new addings
gem 'iconv'

### total removals - gems that were removed
gem 'rubyjedi-actionwebservice', '~> 2.3.5.20100714122544', :require => 'action_web_service'
gem 'therubyracer', '~> 0.12.0' # in favour to use nodejs

gem 'yard-cucumber'
t/dependencies.rb:183:in `require': /Users/c-johan.tique/.rbenv/versions/2.7.8/lib/ruby/gems/2.7.0/gems/cucumber-1.1.9/lib/cucumber/ast/feature_element.rb:52: circular argument reference - name (SyntaxError)

## Imagemagick trick
The error indicates that the rmagick gem can’t find the Magick‑config script. This is common when using Homebrew’s ImageMagick 7, which doesn’t include Magick‑config by default. The rmagick version you’re using (2.13.2) expects ImageMagick 6.

Solution Steps:
	1.	Install ImageMagick 6:
Instead of the default ImageMagick, install the ImageMagick 6 formula:

brew install imagemagick@6

	2.	Adjust Your PATH:
Make sure the installed ImageMagick 6 binaries (including Magick‑config) are in your PATH. For Apple Silicon, you may need to add:

export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"

You can add this line to your shell profile (e.g., ~/.zshrc) and reload your shell.

	3.	Reinstall the rmagick Gem:
Now try installing rmagick again:

gem install rmagick -v '2.13.2'

or run bundle install if you’re using Bundler.

These steps should allow rmagick to locate Magick‑config and build its native extensions successfully.

When you still get the “Can’t find MagickWand.h” error even after installing ImageMagick and adjusting your PATH, it usually means that the compiler isn’t finding the include directory for ImageMagick’s headers. For rmagick 2.13.2 (which is tied to ImageMagick 6), you can try the following:
	1.	Verify You Installed ImageMagick 6:
Make sure you installed the ImageMagick 6 formula rather than the default (ImageMagick 7). For example:

brew install imagemagick@6

	2.	Set the PKG_CONFIG_PATH Variable:
The MagickWand headers are usually located in the ImageMagick 6 include folder. Tell pkg-config where to find the ImageMagick 6 configuration:

export PKG_CONFIG_PATH="/opt/homebrew/opt/imagemagick@6/lib/pkgconfig:$PKG_CONFIG_PATH"

	3.	Set the CPATH (or C_INCLUDE_PATH) Variable:
This helps the compiler locate the headers like MagickWand.h. For example:

export CPATH="/opt/homebrew/opt/imagemagick@6/include/ImageMagick-6:$CPATH"

(On some systems you might use C_INCLUDE_PATH instead of CPATH.)

	4.	Set the LIBRARY_PATH Variable (if necessary):
To ensure the linker finds the libraries:

export LIBRARY_PATH="/opt/homebrew/opt/imagemagick@6/lib:$LIBRARY_PATH"

	5.	Re-run the Gem Installation:
Now try installing rmagick again:

gem install rmagick -v '2.13.2'

These environment variables direct both pkg-config and the C compiler to the right directories provided by ImageMagick 6. If you continue to have issues, double-check that the file /opt/homebrew/opt/imagemagick@6/include/ImageMagick-6/MagickWand.h actually exists. Adjust the paths if your Homebrew installation is in a different location.

## Use a Patched Fork or Upgrade if Possible:
Since rmagick 2.13.2 is quite old, there may be forks or patches available online that address Ruby 2.7 compatibility. Searching GitHub for a fork of rmagick that supports Ruby 2.7 (or even trying a later version if your application can work with it) might save you the manual patching.

## Final problems

- the most critical problem is the custom fork they did for Money, there are some methods that are conflicting especially the sort ones now that I am using Ruby 2.7.8

# Going to Rails 3
Rails 3 is not running on Blundler > 1.0
➜  blurby git:(upgrade) ✗ gem install bundler:1.17.3
Fetching bundler-1.17.3.gem
Successfully installed bundler-1.17.3
Parsing documentation for bundler-1.17.3
Installing ri documentation for bundler-1.17.3
Done installing documentation for bundler after 1 seconds
1 gem installed
➜  blurby git:(upgrade) ✗ gem uninstall bundler -v 2.2.34
Successfully uninstalled bundler-2.2.34

bundle _1.17.3_ install

## dependencies updated
cacheable_flash 1.0.0 [*] (= 0.2.0) https://github.com/pboling/cacheable-flash/tags

db-charmer '1.9.1' [*] dependency not satisfied https://github.com/kovyrin/db-charmer/releases/tag/v1.9.0

after_commit / this is also part of thinking_sphinx (but an older version), so we need to include this before thinking_sphinx or we don't get the new version

gem 'thinking-sphinx' '2.1.0', [*] '~> 1.3', :require => 'thinking_sphinx'

gem 'no_peeping_toms', '~> 1.1.0' **disabled** NOTE: This functionality is included in Rails 3.1 and above. Disables observers during testing, allowing you to write model tests that are completely decoupled from the observer. Also lets you enable observers for a certain block of code, so that you can write observer tests

gem 'activemerchant', 1.75.0 [*] '1.43.3', :require => 'active_merchant'

gem 'rails_best_practices', '1.15.7'

gem 'factory_girl', '2.3.2' to gem 'factory_girl_rails', '4.5.0'

gem 'jasmine', '~> 1.3.2'

gem 'guard-jasmine', '1.14', :require => 'guard/jasmine'

gem 'omniauth-facebook' '4.0.0' [*]

gem 'thin', '1.8.2' [*]

gem 'rspec-rails', '1.3.4'
gem 'guard-rspec', '~> 1.2.1'

gem 'dropbox_api', '~> 0.1.19', :git => 'https://github.com/blurb/dropbox_api.git'
gem 'omniauth' '1.3.2' [*]

gem 'webrat', '0.7.1'

gem 'rdoc', '4.1.2'

gem 'will_paginate', '3.0.12'

gem 'paperclip', '2.3.16', :require => 'paperclip'
gem 'paperclip', '3.5.4', :require => 'paperclip'

## new additions

gem 'mail', '2.5.5'

commented not needed code on /Users/c-johan.tique/Dev/code/rpi/blurby_all/analysis/blurby/config/initializers/utf8_encoding.rb

```ruby
# Serialized columns in AR don't support UTF-8 well, so set the encoding on those as well.
# class ActiveRecord::Base
#   def unserialize_attribute_with_utf8(attr_name)
#     traverse = lambda do |object, block|
#       if object.kind_of?(Hash)
#         object.each_value { |o| traverse.call(o, block) }
#       elsif object.kind_of?(Array)
#         object.each { |o| traverse.call(o, block) }
#       else
#         block.call(object)
#       end
#       object
#     end
#     force_encoding = lambda do |o|
#       o.force_encoding(Encoding::UTF_8) if o.respond_to?(:force_encoding)
#     end
#     value = unserialize_attribute_without_utf8(attr_name)
#     traverse.call(value, force_encoding)
#   end
#   alias_method_chain :unserialize_attribute, :utf8
# end
```

> TypeError: Cannot visit Integer
The issue is specifically caused when Arel encounters integer nodes (Arel::Nodes::Limit) and tries to pass them to the visitor without converting them properly.
The above initializer explicitly adds a visitor for integers (visit_Integer), converting them properly to strings before appending to the SQL query.
```ruby
# config/initializers/arel_compatibility_patch.rb

# Fix for Arel::Visitors::ToSql visitor
module Arel
  module Visitors
    class ToSql
      def visit_Arel_Nodes_Limit(o)
        "LIMIT #{visit(o.expr.to_i)}"
      end

      def visit_Integer(o)
        o.to_s
      end
    end

    # Additional fix for Arel::Visitors::DepthFirst visitor
    class DepthFirst
      def visit_Integer(o)
        # DepthFirst typically expects to return an array, even if empty.
        []
      end
    end
  end
end
```

> NoMethodError: undefined method `filter_parameter_logging' for ApplicationController:Class
```ruby
# config/initializers/filter_parameters.rb

Rails.application.config.filter_parameters += [:credit_card, :password]
```

> undefined method `named_scope' for #<Class:0x000000012abe03e0>
```ruby
#config/initializers/named_scoped_compatibility.rb
# Rails 3.x compatibility patch for named_scope
class ActiveRecord::Base
  class << self
    alias_method :named_scope, :scope unless method_defined?(:named_scope)
  end
end
```

> NoMethodError: undefined method 'verify' for Admin::Product::SwearchController:Class
```ruby
# Backward compatibility for Rails 2.x 'verify' method in controllers (Rails 3.x)
module VerifyMethodCompatibility
  def verify(options)
    before_filter(options.slice(:only, :except)) do |controller|
      valid_methods = Array(options[:method]).map(&:to_s).map(&:upcase)
      unless valid_methods.include?(controller.request.method)
        controller.send(options[:redirect_to] ? :redirect_to : :head, options[:redirect_to] || :method_not_allowed)
        false
      end
    end
  end
end

ActionController::Base.extend(VerifyMethodCompatibility)
```

> Problems with scope / namespaces
```ruby
class My::DashboardController < ApplicationController
  include BookActions
  include ProfileHelper
  include AppFeatureUtils
  helper ::My::AccountHelper # <==
  helper SellMoreBooksHelper
  helper ::My::DashboardHelper # <==
```

> ActionController::UrlWriter
```ruby
# this
include ActionController::UrlWriter
# replace with
include Rails.application.routes.url_helpers
```

> before_validation_on_create :generate_keys, the on_create cnodition in several parts
```ruby
before_validation :generate_keys, :on => :create
after_validation :generate_token, :on => :create
```

> rewrite all routes to new syntax and components
use Ai to do that, be careful about syntax
for example, sometimes it uses match instead of get, that could be problematic


> use `rails server` to run the server

> #<NoMethodError: undefined method find_with_deleted' for #<Class:0x000000012fac1ab8>>` acts as paranoid
```ruby
# config/initializers/find_with_deleted_compatibility.rb
class ActiveRecord::Base
  def self.find_with_deleted(*args)
    self.unscoped { self.find(*args) }
  end

  def self.count_with_deleted(*args)
    self.unscoped { self.count(*args) }
  end
end
```

> NoMethodError: undefined method `request_uri' for #<ActionDispatch::Request:...>
```ruby
# app/helpers/navigation_helper.rb:
def active_nav?(tab)
  if tab == 'bookstore-dropdown'
    BOOKSTORE_NAV.include? request.request_uri
  elsif tab == 'formats-pricing-dropdown'
    request.request_uri.include? '/pricing'
  end
end

def active_nav?(tab)
  if tab == 'bookstore-dropdown'
    BOOKSTORE_NAV.include? request.fullpath
  elsif tab == 'formats-pricing-dropdown'
    request.fullpath.include? '/pricing'
  end
end
```

---

## deal with partial views `_` conventions with underscore char

## render with `=` and not with `-`

# Final conclusions

- after the PoC of the migration, booting speed was increased by 25X, the majority of dependencies could work without much interventionm that means that the temporary pipeline will be easir to build and configure, and guarantee changes and new features could be implemented faster

- focus first 2 - 4 weeks in guaranteeing 100% of testing converage in the components that are part of the blurby distribution that will coexist with Blurb 2.0, identifying explicitly the endpoints needed mapping completely all of the processes, business logic required, current level of tests are close to 60%

- stabilize at Rails 4 and Ruby 2.7.8, Rails 3 has some challenges in dependencies terms that in Rails 4 upgraded until 2020 are way more easy to solve and meet.

- be very careful with `Money` related logic and with `acts-as-paranoid` related logic, auto saving and callbacks classes capabilities are creating a lot of problems, this is afecting all operations related with money and currencies, and all operations related to soft deletion. To do this we are going to use a technique to isolate independendly the models and dependencies fix the broken and uncompatible legacy code, so in this part a re-writing is required affeting about 20 main models order, line items and produc options are part of them

- be careful with new JS and CSS pipeline distribution based on sprockets