class ChangeWeightTypeInMeausurements < ActiveRecord::Migration
  def self.up
   change_column :measurements , :weight, :float
   change_column :measurements, :hba1c,  :float
  end
end
