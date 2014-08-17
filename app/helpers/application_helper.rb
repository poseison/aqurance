module ApplicationHelper
  def resource_name
      :patient
    end
 
    def resource
      @resource ||= Patient.new
    end
 
    def devise_mapping
      @devise_mapping ||= Devise.mappings[:patient]
    end
end
