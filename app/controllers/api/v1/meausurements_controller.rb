module Api
  module V1
    class MeausurementsController < ApplicationController
      skip_before_filter :verify_authenticity_token
     # before_filter :restrict_access
      respond_to :json
            def index
              
            end
      
            def show
              
            end
      
            def create
             @c1=params[:measurement]
             puts @c1.to_json
             msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
             render :json => msg
            end
      
            def update
              
            end
      
            def destroy
              
            end
            private
                  def restrict_access
                    api_key = ApiKey.find_by_access_token(params[:access_token])
                    head :unauthorized unless api_key
                  end
    end
  end
end
    
