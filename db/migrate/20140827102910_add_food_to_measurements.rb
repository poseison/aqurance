class AddFoodToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :foods, :string
  end
end
