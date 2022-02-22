class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    set_flash_message! :notice, :signed_up, name: resource.name
  end
end
