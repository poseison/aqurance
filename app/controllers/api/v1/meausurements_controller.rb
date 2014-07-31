module Api
  module V1
    class MeausrementsController < ApplicationController
      before_filter :restrict_access
      respond_to :json
            def index
              respond_with Meausurement.all
            end
      
            def show
              respond_with Meausurement.find(params[:id])
            end
      
            def create
              respond_with Meausurement.create(params[:product])
            end
      
            def update
              respond_with Meausurement.update(params[:id], params[:products])
            end
      
            def destroy
              respond_with Meausurement.destroy(params[:id])
            end
            private
                  def restrict_access
                    api_key = ApiKey.find_by_access_token(params[:access_token])
                    head :unauthorized unless api_key
                  end
    end
  end
end
    
