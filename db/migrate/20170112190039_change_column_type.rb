class ChangeColumnType < ActiveRecord::Migration[5.0]
  def up
    change_column :agents, :suburb_id, :string
    change_column :agents, :state_id, :string
  end
end
