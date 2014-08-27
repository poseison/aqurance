module Api
  module V1
    class MregistersController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      def create
        @email=params[:email]
        @usrname=params[:username]
        @mpasswd=params[:password]
        puts @mpasswd
        if Patient.exists?(email:@email) || Patient.exists?(pusername: @usrname) 
          puts' Patient exists'
          msg = { :status => "no", :message => "Existing credentials!", :html => "<b>...</b>" }
        else
          @npatient=Patient.new
          msg=Hash.new
          @npatient.email=@email
          @npatient.password=@mpasswd
          @npatient.pUsername=@usrname
          if @npatient.save
            puts 'Patient saved'
            msg = { :status => "ok",:provideapi=> ApiKey.create!, :message => "Success!", :html => "<b>...</b>" }
          else
            puts 'Patient not save'
            puts @npatient.errors.full_messages
            msg = { :status => "no", :message => @npatient.errors.full_messages, :html => "<b>...</b>" }
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
