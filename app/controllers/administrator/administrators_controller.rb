# frozen_string_literal: true

class Administrator::AdministratorsController < ApplicationController
  before_action :administrator_authentication

  layout 'admin'

  def administrator_authentication
    unless administrator_signed_in?
      flash[:alert] = 'You are not authorized.'
      redirect_to root_path
    end
  end

end
