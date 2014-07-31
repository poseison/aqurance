class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :measuretype
      t.datetime :mdate
      t.string :comments
      t.integer :glucoze
      t.boolean :didinsul
      t.integer :insuleinunits
      t.boolean :didscheduleat
      t.datetime :alertdt

      t.timestamps
    end
  end
end
