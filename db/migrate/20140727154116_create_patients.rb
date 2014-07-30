class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :page
      t.string :pname
      t.integer :pgender
      t.string :pUsername
      t.integer :pweight

      t.timestamps
    end
  end
end
