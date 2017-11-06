class AdminController < ApplicationController
  before_action :ensure_admin

  protected
  def ensure_admin
    if !current_user.is_admin?
      redirect_to landing_page_path
    end
  end

  def is_admin?
    current_user.admin == true
  end
end
