class ChangeColumnTypeOfStateIdAndSuburbId < ActiveRecord::Migration[5.0]
  def up
    remove_column :agents, :suburb_id
    remove_column :agents, :state_id
  end

  def down
    add_column :agents, :suburb_id, :string
    add_column :agents, :state_id, :string
  end
end
