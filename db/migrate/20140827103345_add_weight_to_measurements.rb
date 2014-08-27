class AddWeightToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :weight, :integer
  end
end
