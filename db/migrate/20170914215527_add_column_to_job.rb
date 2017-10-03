class AddColumnToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :where, :string
  end
end
