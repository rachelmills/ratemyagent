class RenameSuburbAndStateFromId < ActiveRecord::Migration[5.0]
  def change
    rename_column :agents, :suburb_id, :suburb
    rename_column :agents, :state_id, :state
  end
end
