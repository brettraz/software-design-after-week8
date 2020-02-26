# Set up for the application and database. DO NOT CHANGE. ##############
require "sequel"                                                       #
DB = Sequel.connect "sqlite://#{Dir.pwd}/development.sqlite3"          #
########################################################################  

# Database schema - this should reflect your domain model
DB.create_table! :items do
  primary_key :id
  Boolean :status_available
  String :item_type
  String :item_name
  String :condition
  String :description, text: true
  String :price
  
end

  
 

DB.create_table! :customer_input do
  primary_key :id
  foreign_key :item_id
  String :customer_name
  String :customer_phone_number
  String :customer_e_mail
  String :desired_pick_up_times, text: true
end
# Insert initial (seed) data
items_table = DB.from(:items)


items_table.insert(item_name: "child gates", 
                    description: "3 sets of gates to hook up in your home to protect your young kids from stairs and keep pets on one level.  Child proof to open and close.",
                    item_type: "child gates",
                    condition: "like new",
                    price: "$30",
                    status_available: 1)
                    

                    items_table.insert(item_name: "Child Crib and bed", 
                    description: "3 in 1 crib, toddler bed, bed with gates.  This will accomodate your child's sleeping needs from infant to adolescent all in this convertible set.",
                    item_type: "crib and child's bed",
                    condition: "Used but stil good condition",
                    price: "$85",
                    status_available: 1)
                    