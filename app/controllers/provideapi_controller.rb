class ProvideapiController < ApplicationController
  def provide
    @c1=ApiKey.create!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @c1 }
      format.json { render :json => @c1 }
    end
  end
end
