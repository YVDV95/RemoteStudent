class AddTypejobIdToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :typejob_id, :integer
  end
end
