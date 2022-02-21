class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      admin_tests_path
    else
      root_path
    end
  end
end
