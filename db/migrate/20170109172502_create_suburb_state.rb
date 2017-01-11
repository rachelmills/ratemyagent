class CreateSuburbState < ActiveRecord::Migration[5.0]
  def change
    create_table :suburb_states do |t|
      t.string :suburb
      t.string :state
    end
  end
end
