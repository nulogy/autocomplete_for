# frozen_string_literal: true

module AutocompleteFor
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def autocomplete_for(association, field, options = {}, &block)
      allow_nil = options[:allow_nil] || false
      validate :"validate_#{association}_by_#{field}"
      before_validation :"associate_#{association}_by_#{field}"
      instance_variable_set(:"@#{association}_#{field}_allow_nil", allow_nil)

      # method to set the name of the entity to autocomplete
      # def customer_name=(name)
      #   @customer_name = name
      # end
      define_method(:"#{association}_#{field}=") do |name|
        instance_variable_set(:"@#{association}_#{field}", name)
      end

      # method to retrieve the name of the entity to autocomplete
      # def customer_name
      #   self.customer_to.name : @customer_name
      # end
      define_method(:"#{association}_#{field}") do
        send(association.to_sym) ? send(association.to_sym).send(field.to_sym) : instance_variable_get(:"@#{association}_#{field}")
      end

      # Validation method to make sure the autocompleted name resolves to an actual entity
      # def validate_customer_by_name
      #   return unless @customer_name
      #   return if self.customer
      #   return if @@customer_name_allow_nil && @customer_name == ""
      #
      #   self.errors.add :customer_name, "#{@customer_name} does not exist"
      # end
      define_method(:"validate_#{association}_by_#{field}") do
        return unless instance_variable_get(:"@#{association}_#{field}")
        return if send(association.to_sym)
        return if self.class.instance_variable_get(:"@#{association}_#{field}_allow_nil") && instance_variable_get(:"@#{association}_#{field}") == ''

        errors.add(:"#{association}_#{field}", :does_not_exist)
      end

      # Resolve the autocompleted name to an actual entity
      # def autocomplete_find_customer_by_name
      #   if self.site
      #     self.customer = self.site.floor_locations.find(:first, :include => :location, :conditions => {:'locations.name' => @customer_name})
      #   end
      # end
      define_method(:"autocomplete_find_#{association}_by_#{field}", block)

      # def associate_customer_by_name
      #   return unless @customer_name
      #
      #   if @customer_name == ''
      #     self.customer = nil
      #     return
      #   end
      #
      #   autocomplete_find_customer_by_name
      # end
      define_method(:"associate_#{association}_by_#{field}") do
        return unless instance_variable_get(:"@#{association}_#{field}")

        if instance_variable_get(:"@#{association}_#{field}") == ''
          send(:"#{association}=", nil)
          return
        end

        send(:"autocomplete_find_#{association}_by_#{field}")
      end

      # set up validation on association in case the customer_name isn't set
      error_fields_name = :"@#{association}_autocomplete_error_fields"
      error_fields = instance_variable_get(error_fields_name) || []
      error_fields << :"#{association}_#{field}"

      instance_variable_set(error_fields_name, error_fields)

      unless allow_nil
        # we must make sure that the validate_by_customer validation runs
        # after ALL validations on autocomplete fields
        # skip_callback :validate, :by, :"#{association}"

        validate :"validate_by_#{association}"

        unless instance_methods.include?("validate_by_#{association}")

          # def validate_by_customer
          #   self.errors.add_on_blank(:customer) unless @@customer_autocomplete_error_fields.any? {|ef| self.errors[ef]}
          # end
          define_method(:"validate_by_#{association}") do
            return if self.class.instance_variable_get(error_fields_name).any? { |ef| errors[ef].any? }
            return unless send(:read_attribute_for_validation, association.to_sym).blank?

            errors.add(association.to_sym, :blank, options)
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, AutocompleteFor)
