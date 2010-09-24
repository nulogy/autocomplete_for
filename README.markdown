AutocompleteFor
===============

This plugin implements model-side logic for autocompleting belongs_to associations.  It handles validations, autocompleting the same association via different fields (say name or login) and the ability to specify a custom finder block.

It works out-of-the-box with existing front-end autocompletion solutions because all it does is set the value of the belongs_to association based on an attribute that can be set directly or via update_attributes (see examples below.)

### Example

    class Post < ActiveRecord::Base
      belongs_to :author

      # set the author_login field to autocomplete by author login
      autocomplete_for :author, :login do
        self.author = Author.find(:first, :conditions => {:name => @author_login})
      end

      # set the author_open_id field to autocomplete by author open_id
      autocomplete_for :author, :open_id do
        self.author = Author.find(:first, :conditions => {:name => @author_open_id})
      end
    end

Copyright (c) 2010 Nulogy Corporation, released under the MIT license
