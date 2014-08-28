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
            msg = { :status => "ok",:provideapi=> ApiKey.create!, :pid=>@npatient.id, :message => "Success!", :html => "<b>...</b>" }
          else
            puts 'Patient not save'
            puts @npatient.errors.full_messages
            msg = { :status => "no", :message => @npatient.errors.full_messages, :html => "<b>...</b>" }
          end
        end
         render :json => msg
      end
      def update
        msg=Hash.new
        mypatient=Patient.find_by_id(params[:id])
        puts params[:id]
        mypatient.pUsername=params[:username]
        mypatient.email=params[:email]
        mypatient.password=params[:password]
        if mypatient.save 
          msg = { :status => "ok", :message => "Updated", :html => "<b>...</b>" }
        else
          msg = { :status => "no", :message => mypatient.errors.full_messages, :html => "<b>...</b>" }
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
