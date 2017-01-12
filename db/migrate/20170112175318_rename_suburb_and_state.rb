class RenameSuburbAndState < ActiveRecord::Migration[5.0]
  def change
    rename_column :agents, :suburb, :suburb_id
    rename_column :agents, :state, :state_id
  end
end
