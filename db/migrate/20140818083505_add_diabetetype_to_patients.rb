class AddDiabetetypeToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :diabetetype, :integer
  end
end
