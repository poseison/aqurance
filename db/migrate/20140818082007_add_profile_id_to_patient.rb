class AddProfileIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :profile_id, :integer
  end
end
