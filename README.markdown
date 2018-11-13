## Current Version

[![Build Status](https://travis-ci.org/nulogy/autocomplete_for.svg?branch=master)](https://travis-ci.org/nulogy/autocomplete_for)

This version was introduced to support Rails 5. It depends on activerecord ~> 5.0 and contains several large gem upgrades.
This is not a backwards compatible upgrade, and introduces many breaking changes if there is no gem compatibility.

For Rails 4 support please use: [v0.3.0](https://github.com/nulogy/autocomplete_for/tree/v0.3.0)

AutocompleteFor
===============

This plugin implements model-side logic for autocompleting belongs_to associations.  It handles validations, autocompleting the same association via different fields (say name or login) and the ability to specify a custom finder block.

It works out-of-the-box with existing front-end autocompletion solutions because all it does is set the value of the belongs_to association based on an attribute that can be set directly or via update_attributes (see examples below.)

### Example

```ruby
    class Author < ActiveRecord::Base
      # has a login and open_id column
    end

    class Post < ActiveRecord::Base
      belongs_to :author

      # set the author_login field to autocomplete by author login
      autocomplete_for :author, :login do
        self.author = Author.find(:first, :conditions => {:login => @author_login})
      end

      # set the author_open_id field to autocomplete by author open_id
      autocomplete_for :author, :open_id do
        self.author = Author.find(:first, :conditions => {:open_id => @author_open_id})
      end
    end
```

Using autocomplete_for in your models to set belongs_to associations:

```ruby
    author = Author.create! :login => 'baz'
    post = Post.create! :author_login => 'baz'    # automatically finds the author with the login 'baz'
    puts post.author.login                        # will output 'baz'
```

Errors are generated automatically if the given information does not correspond to a valid model:

```ruby
    author = Author.create! :login => 'baz'
    post = Post.create :author_login => 'quux'
    puts post.errors[:author_login]               # will print an error message
```

### Running the tests
You can run the unit tests using `bundle exec rake test`; it assumes you have a Postgres database
configured as per `test/database.yml` (e.g. credentials are valid, database exists).

Copyright (c) 2018 Nulogy Corporation, released under the MIT license
