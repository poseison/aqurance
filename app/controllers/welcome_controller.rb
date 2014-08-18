class WelcomeController < ApplicationController
  before_action :authenticate_patient!
  def index
    @myuser=current_patient
    
  end
end
