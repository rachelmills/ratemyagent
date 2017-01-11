# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# puts "Importing states and suburbs"
#
# csv_text = File.read(Rails.root.join('Aus_State_Suburb.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   s = SuburbState.new
#   s.suburb = row['Suburb']
#   s.state = row['State']
#   s.save
#   puts "#{s.suburb}, #{s.state} saved"
# end
#
# puts "There are now #{SuburbState.count} rows in the SuburbState table"

# run the above using rake db:seed

# NB The above method was taken from https://gist.github.com/arjunvenkat/1115bc41bf395a162084

# puts "Importing states"
#
# csv_text = File.read(Rails.root.join("aus_state.csv"))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   st = State.new
#   st.state_name = row['state_name']
#   st.save
#   puts "#{st.state_name} saved"
# end
#
# puts "There are now #{State.count} rows in the State table"

puts "Importing suburbs"

csv_text = File.read(Rails.root.join("aus_suburb.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  su = Suburb.new
  su.suburb_name = row['suburb_name']
  su.state_id = row['state_id']
  su.save
  puts "#{su.suburb_name} saved"
end

puts "There are now #{Suburb.count} rows in the Suburb table"