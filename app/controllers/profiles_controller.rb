class ProfilesController < ApplicationController
  before_action :authenticate_patient!
  def show
    @myuser=current_patient
    puts @myuser.email
    
  end
end
