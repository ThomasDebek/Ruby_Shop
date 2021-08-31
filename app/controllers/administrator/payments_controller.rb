# frozen_string_literal: true

class Administrator::PaymentsController < ApplicationController
  def complete
    flash[:notice] = 'COMPLETE'
  end

  def fail
    flash[:alert] = 'FAIL'
  end
end
