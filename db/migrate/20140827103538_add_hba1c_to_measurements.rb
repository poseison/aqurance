class AddHba1cToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :hba1c, :integer
  end
end
