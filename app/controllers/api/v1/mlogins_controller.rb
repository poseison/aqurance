module Api
  module V1
    class MloginsController < ApplicationController
      before_filter :fix_json_params
      skip_before_filter :verify_authenticity_token
      def create
        @mpassword=request.headers["password"]
        @memail=request.headers["email"]
        user = Patient.find_by_email(@memail)
        if user.password=@mpassword
          msg = { :status => "ok", :message => "Success!", :provideapi=> ApiKey.create!,:html => "<b>...</b>" }
        else
          msg = { :status => "no", :message => "Failure!", :html => "<b>...</b>" }
        end
        render :json => msg
      end
      
      private
            def fix_json_params
                if request.content_type == "application/json"
                  @reparsed_params = JSON.parse(request.body.string).with_indifferent_access
                end
              end
              def params
                  @reparsed_params || super
                end
      
      
    
    end
  end
end