class CreateMregisters < ActiveRecord::Migration
  def change
    create_table :mregisters do |t|
      t.string :email
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
