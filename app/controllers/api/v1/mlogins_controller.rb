module Api
  module V1
    class MloginsController < ApplicationController
      before_filter :fix_json_params
      skip_before_filter :verify_authenticity_token
      def create
        @mpassword=params[:password]
        @memail=params[:email]
        msg=Hash.new
        puts request.headers
        user = Patient.find_by_email(@memail)
        if user==nil
          msg = { :status => "no", :message => "User doen't exist", :html => "<b>...</b>" }
        else
          
        if user.valid_password?(@mpassword)
          msg = { :status => "ok", :message => "Success!", :provideapi=> ApiKey.create!,:html => "<b>...</b>" }
        else
          msg = { :status => "no", :message => "Failure!", :html => "<b>...</b>" }
        end
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