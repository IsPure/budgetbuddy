class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,  keys: [:balance])
      devise_parameter_sanitizer.permit(:account_update, keys: [:balance])
    end
    def after_sign_in_path_for(resource)
      transactions_path
    end
    def after_update_path_for(resource)
      transactions_path(resource)
    end
    
  end
