module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:password])
    end
end

DeviseController.send :include, DevisePermittedParameters