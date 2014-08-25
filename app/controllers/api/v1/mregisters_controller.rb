module Api
  module V1
    class MregistersController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      def create
        @email=params[:email]
        @usrname=params[:username]
        @mpasswd=params[:password]
        @npatient=Patient.new
        msg=Hash.new
        if Patient.exists?(email:@email)
          puts' Patient exists'
          msg = { :status => "failure", :message => "Failure!", :html => "<b>...</b>" }
        else
          @npatient.email=@email
          @npatient.password=@mpasswd
          @npatient.pUsername=@usrname
          @npatient.save
          msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
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