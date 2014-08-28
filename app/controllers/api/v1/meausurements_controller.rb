require 'json'
module Api
  module V1
    class MeausurementsController < ApplicationController
   
      skip_before_filter :verify_authenticity_token     
      respond_to :json
            def index
              
            end
      
            def show
              
            end
      
            def create
             @c1=params[:measurement]
             puts @c1.class
             puts request.inspect
             act=request.headers["HTTP_ACCESS_TOKEN"]
             puts act
             msg=Hash.new
             if !ApiKey.exists?(access_token: act)  
                 msg = { :status => "no", :message => "Unauhtorized!"}
             else
  
          
             puts @c1
             @c1.each do |x|
             myhash=x
             puts request.headers
             mtr=Measurement.new
             mtr.comments=myhash["comments"]
             mtr.glucoze=myhash["glucoze"]
             mtr.alertdt=myhash["alertDateTime"]
             mtr.didinsul=myhash["didInsulin"]
             mtr.insuleinunits=myhash["insulinUnits"]
             mtr.didscheduleat=myhash["didInsulin"]
             mtr.weight=myhash["weight"].to_f
             mtr.hba1c=myhash["hba1c"].to_f          
             puts myhash["alertDateTime"] 
             puts myhash["comments"]
             puts myhash["didInsulin"]
             puts myhash["foodInfo"]
             puts myhash["insulinID"]
             puts myhash["comments"] 
             mtr.save
             end
             msg=Hash.new
             msg= {:status =>"ok",:message =>"Success"}
             end        
             render :json => msg 
            
            end
      
            def update
              mypatient=Patient.find_by_id(params[:id])
              thename=params[:username]
              mypatient.save              
            end
      
            def destroy
              
            end
            private
                  def restrict_access
                    authenticate_or_request_with_http_token do |token, options|
                      
                        puts token
                        ApiKey.exists?(access_token: token)
                    end
                  end
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
    
