# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.transaction do

  User.create(:email => "cj@appacademy.io")
  User.create(:email => "flarnie@appacademy.io")
  User.create(:email => "jeff@appacademy.io")
  User.create(:email => "gsp@appacademy.io")
  User.create(:email => "boss@appacademy.io")

end
