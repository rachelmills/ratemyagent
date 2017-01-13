require 'csv'

namespace :suburbs do
  desc 'Loading suburbs into database'
  task seed_suburbs: :environment do
    puts 'Importing suburbs'
    csv_text = File.read(Rails.root.join('aus_suburb.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      su = Suburb.new
      su.suburb_name = row['suburb_name']
      su.state_id = row['state_id']
      su.save
      puts "#{su.suburb_name} saved"
    end
    puts "There are now #{Suburb.count} rows in the Suburb table"
  end
end
