class PatientsController < ApplicationController
  respond_to :js
  
  
  def update
    @c1=params[:pname]
    puts @c1
    render "update"
  end
end
