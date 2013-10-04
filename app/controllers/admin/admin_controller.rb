class Admin::AdminController < ApplicationController
  before_filter :global_admin?

private
  def global_admin?
    unless current_user && current_user.is_admin?
      flash[:error] = 'Unauthorized'
      redirect_to root_path
    end
  end
end
