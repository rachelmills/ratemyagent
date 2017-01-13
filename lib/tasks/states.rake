require 'csv'

namespace :states do
  desc 'Loading states into database'
  task seed_states: :environment do
    puts 'Importing states'
    csv_text = File.read(Rails.root.join('aus_state.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      st = State.new
      st.state_name = row['state_name']
      st.save
      puts "#{st.state_name} saved"
    end
    puts "There are now #{State.count} rows in the State table"
  end
end
