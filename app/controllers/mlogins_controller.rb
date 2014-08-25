class MloginsController < ApplicationController
  def create
    @mpassword=request.headers["password"]
    @memail=request.header["email"]
    user = Patient.find_by_email(@memail)
    if user.password=@mpassword
      msg = { :status => "ok", :message => "Success!", :provideapi=> ApiKey.create!,:html => "<b>...</b>" }
    else
      msg = { :status => "no", :message => "Failure!", :html => "<b>...</b>" }
    end
    render :json => msg
  end
      
      
    
end
