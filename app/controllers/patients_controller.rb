class PatientsController < ApplicationController
  respond_to :js
  
  
  def update
    pid=params[:id]
    puts params[:update_attributes]
    @mypatient=Patient.find(pid)
    patientname=params[:pname]
    puts "from the patients controller"
    puts patientname
    @mypatient.pname=patientname
    @mypatient.save
    render "update"
  end
end
