class ChangeColumnTypeOfStateIdAndSuburbId < ActiveRecord::Migration[5.0]
  # def change
  #   reversible do |dir|
  #     change_table :agents do |t|
  #       dir.up { t.change :suburb_id, :integer, 'integer USING CAST(state_id AS integer)' }
  #       dir.down { t.change :suburb_id, :string }
  #       dir.up { t.change :state_id, :integer, 'integer USING CAST(state_id AS integer)' }
  #       dir.down { t.change :state_id, :string }
  #     end
  #   end
  # end
  def up
    remove_column :agents, :suburb_id
    remove_column :agents, :state_id
  end

  def down
    add_column :agents, :suburb_id, :string
    add_column :agents, :state_id, :string
  end
end

