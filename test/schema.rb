ActiveRecord::Schema.define(:version => 0) do  
  create_table :customers, :force => true do |t| 
    t.string :name, :unique => true  
    t.string :code, :unique => true
  end  
  create_table :vendors, :force => true do |t| 
    t.string :name, :unique => true  
    t.string :code, :unique => true
  end  
  create_table :auto_complete_for_customer_test_models, :force => true do |t| 
    t.integer :customer_id  
  end  
  create_table :auto_complete_for_suppress_if_test_models, :force => true do |t| 
    t.integer :customer_id  
  end  
  create_table :auto_complete_for_vendor_test_models, :force => true do |t| 
    t.integer :vendor_id  
  end  
end 
