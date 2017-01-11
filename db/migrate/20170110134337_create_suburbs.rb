class CreateSuburbs < ActiveRecord::Migration[5.0]
  def change
    create_table :suburbs do |t|
      t.string :suburb_name
      t.integer :state_id
    end
  end
end
