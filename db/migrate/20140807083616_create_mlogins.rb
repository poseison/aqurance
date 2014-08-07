class CreateMlogins < ActiveRecord::Migration
  def change
    create_table :mlogins do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
