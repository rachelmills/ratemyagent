class DropSuburbState < ActiveRecord::Migration[5.0]
  def change
    drop_table :suburb_states
  end
end
