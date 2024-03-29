class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :bank_details])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :bank_details])
  end

  private

  # TODO: uncomment once dashboard is implemented
  # def after_sign_in_path_for(resource_or_scope)
  #   dashboard_path
  # end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # TODO: uncomment once dashboard is implemented
  # def after_log_in_path_for(resource_or_scope)
  #   dashboard_path
  # end

end
