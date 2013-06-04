# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Add roles
# Role.delete_all
roles = Role.create([{:role_name => "PhD Student"}, {:role_name => "Supervisor"}, {:role_name => "Administrator"}])

User.delete_all
User.create(:name => "Phd Stud", 
            :email => "phd@student.aau.dk", 
            :hashed_password => "Test1234",
            :password => "Test1234",
            :password_confirmation => "Test1234", 
            :role_id => 1)
            
User.create(:name => "Super", 
            :email => "super@cs.aau.dk", 
            :hashed_password => "Test1234",
            :password => "Test1234",
            :password_confirmation => "Test1234", 
            :role_id => 2)
            
User.create(:name => "Admin", 
            :email => "admin@aau.dk", 
            :hashed_password => "Test1234",
            :password => "Test1234",
            :password_confirmation => "Test1234", 
            :role_id => 3)