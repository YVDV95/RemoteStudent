class AddColumnToJobAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :money, :string
    add_column :jobs, :hours, :integer
  end
end
