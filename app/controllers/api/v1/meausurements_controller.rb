require 'json'
module Api
  module V1
    class MeausurementsController < ApplicationController
      before_filter :fix_json_params
      skip_before_filter :verify_authenticity_token
     # before_filter :restrict_access
      respond_to :json
            def index
              
            end
      
            def show
              
            end
      
            def create
             @c1=params[:measurement]
             hash=Hash.new
             mtr=Measurement.new
             hash=@c1
             mydate=hash["alertDateTime"]
             dinsulin=hash["didInsulin"]
             scdalert=hash["scheduleAlert"]
             mtglucoze=hash["glucoze"]
             mthbalc=hash["hba1c"]
             mttype=hash["type"]
             mycomments=hash["comments"]
             mtr.alertdt=mydate
             mtr.glucoze=mtglucoze
             mtr.comments=mycomments
             mtr.measuretype=hash["type"]
             mtr.save
             msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
             render :json => msg
            end
      
            def update
              
            end
      
            def destroy
              
            end
            private
                  def restrict_access
                    authenticate_or_request_with_http_token do |token, options|
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
    
