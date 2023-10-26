# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController

  def after_sign_in_path_for(resource)
    public_customers_information_path(current_customer)
  end

end
