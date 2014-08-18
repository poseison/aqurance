class RegistrationsController < Devise::RegistrationsController
  skip_before_filter  :verify_authenticity_token
   before_filter :update_sanitized_params, if: :devise_controller?
 
  def create
    build_resource(sign_up_params)
 
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        return render :json => {:success => true}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        return render :json => {:success => true}
      end
    else
      clean_up_passwords resource
      return render :json => {:success => false}
    end
  end
  def update
      super
    end
 
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
  def update_sanitized_params
        devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:pname, :email,   :password, :password_confirmation)}
     end
  def sign_up_params
  devise_parameter_sanitizer.sanitize(:sign_up)
  end
end