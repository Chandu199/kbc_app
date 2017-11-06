class AdminController < ApplicationController
  before_action :ensure_admin

  protected
  def ensure_admin
    if current_user.admin != true
      redirect_to landing_page_path
    end
  end
end
