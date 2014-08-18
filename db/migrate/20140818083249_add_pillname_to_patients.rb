class AddPillnameToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :pillname, :string
  end
end
