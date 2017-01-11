class RenameSuburbAndState < ActiveRecord::Migration[5.0]
  def change
    rename_column :agents, :suburb, :suburb_id
    change_column :agents, :suburb_id, :integer
    rename_column :agents, :state, :state_id
    change_column :agents, :state_id, :integer
  end
end
