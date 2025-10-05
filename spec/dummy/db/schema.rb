# frozen_string_literal: true

ActiveRecord::Schema[7.1].define(version: 2025_10_05_000000) do
  create_table :customers, force: true do |t|
    t.string :name
    t.string :code
  end

  create_table :vendors, force: true do |t|
    t.string :name
    t.string :code
  end

  create_table :auto_complete_for_customer_test_models, force: true do |t|
    t.integer :customer_id
  end

  create_table :auto_complete_for_vendor_test_models, force: true do |t|
    t.integer :vendor_id
  end
end
