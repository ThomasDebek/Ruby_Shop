# frozen_string_literal: true

class Administrator::AdministratorsController < ApplicationController


  layout 'administrator'
  before_action :administrator_authentication

  def administrator_authentication
    unless administrator_signed_in?
      flash[:alert] = 'You are not authorized.'
      redirect_to root_path
    end
  end

end
