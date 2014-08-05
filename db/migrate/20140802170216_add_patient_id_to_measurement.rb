class AddPatientIdToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :patient_id, :integer
  end
end
