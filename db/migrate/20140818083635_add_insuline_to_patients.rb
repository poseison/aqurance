class AddInsulineToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :insuline, :integer
  end
end
